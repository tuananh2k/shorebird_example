enum VehicleStatus {
  parking('P'),
  driving('D'),
  charging('C'),
  reverse('R'),
  neutral('N');

  const VehicleStatus(this.value);

  final String value;
}

enum LaneType {
  goStraight,
  turnLeft,
  turnRight,
  crossroads,
}

enum UnitSpeedType {
  mph("mph"),
  kmh("km/h");

  const UnitSpeedType(this.value);

  final String value;
}

enum MeterType {
  casual("Casual"),
  smart("Smart"),
  sporty("Sporty"),
  tough("Tough");

  const MeterType(this.value);

  final String value;
}
