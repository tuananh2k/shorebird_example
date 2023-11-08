class StepEntity {
  List? intersections;
  Map? maneuver;
  String? name;
  double? duration;
  double? distance;
  String? drivingSide;
  double? weight;
  String? mode;
  Map? geometry;

  StepEntity({
    this.intersections,
    this.maneuver,
    this.name,
    this.duration,
    this.distance,
    this.drivingSide,
    this.weight,
    this.mode,
    this.geometry,
  });

  @override
  String toString() {
    return 'Step{intersections: $intersections, maneuver: $maneuver, name: $name, duration: $duration, distance: $distance, drivingSide: $drivingSide, weight: $weight, mode: $mode, geometry: $geometry}';
  }
}
