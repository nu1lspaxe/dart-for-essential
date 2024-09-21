import '0x001.dart';

/// All classses implicitly define an interface.
class MockSpaceship implements Spacecraft {
  @override
  DateTime? lanchDate;

  @override
  late String name;

  @override
  int? get launchYear => lanchDate?.year;

  @override
  void describe() {
    print('MockSpaceship: $name');
  }
}

abstract class Describalbe {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}