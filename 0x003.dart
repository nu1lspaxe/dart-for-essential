import '0x001.dart';

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.lanchDate, this.altitude);
}

/// Mixins are a way of reusing code in multiple class hierarchies.
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
     print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft.unlaunched(super.name) : super.unlaunched();
}