import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/step_entity.dart';

part 'step_model.g.dart';

@JsonSerializable()
class StepModel {
  List? intersections;
  Map? maneuver;
  String? name;
  double? duration;
  double? distance;
  @JsonKey(name: 'driving_side')
  String? drivingSide;
  double? weight;
  String? mode;
  Map? geometry;

  StepModel({
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

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);

  Map<String, dynamic> toJson() => _$StepModelToJson(this);

  StepEntity toEntity() {
    return StepEntity(
      intersections: intersections,
      maneuver: maneuver,
      name: name,
      duration: duration,
      distance: distance,
      drivingSide: drivingSide,
      weight: weight,
      mode: mode,
      geometry: geometry,
    );
  }
}
