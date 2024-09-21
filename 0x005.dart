import 'dart:io';

import '0x001.dart';

const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);

  /**
   * return Future.delayed(oneSecond).then((_) {
   *    print(message);
   * });
   */
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
          'File for $object already exists. It was modified on $modified.'
        );
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');

    } on IOException catch (e) {
      print('Cannot create description for $objects: $e');
    }
  }
}

/// async* gives a nice, readable way to build streams
Stream<String> report(Spacecraft creaft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    /// yield returns a stream (iterable)
    yield '${creaft.name} files by $object';
  }
}