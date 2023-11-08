// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepModel _$StepModelFromJson(Map<String, dynamic> json) => StepModel(
      intersections: json['intersections'] as List<dynamic>?,
      maneuver: json['maneuver'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      drivingSide: json['driving_side'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      mode: json['mode'] as String?,
      geometry: json['geometry'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StepModelToJson(StepModel instance) => <String, dynamic>{
      'intersections': instance.intersections,
      'maneuver': instance.maneuver,
      'name': instance.name,
      'duration': instance.duration,
      'distance': instance.distance,
      'driving_side': instance.drivingSide,
      'weight': instance.weight,
      'mode': instance.mode,
      'geometry': instance.geometry,
    };
