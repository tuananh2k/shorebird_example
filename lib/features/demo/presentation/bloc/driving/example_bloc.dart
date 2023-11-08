import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/example_entity.dart';

part 'example_bloc.freezed.dart';
part 'example_states.dart';

class ExampleBloc extends Cubit<ExampleState> {
  ExampleBloc() : super(ExampleState(exampleEntity: ExampleEntity()));

/**
    Example sử dụng usecase và check response của usecase

    Future<void> getDirectionToPlace(LocationEntity end) async {
    final start = state.propertiesDriving!.currentLocation;
    if (start == null) {
    return;
    }
    var result = await getIt<GetDirectionsUseCase>().getDirections(start, end);
    result.fold((failure) {
    debugPrint(failure.message);
    }, (data) {
    /// data lúc này đã được validate là 1 list isNotEmpty
    List? coordinates = data.first.geometry?['coordinates'];
    if (coordinates is! List) return;
    List<LatLng> latLngs =
    coordinates.map((e) => LatLng(e[1], e[0])).toList();
    state.mapboxMapController!.clearLines();
    state.mapboxMapController!.addLine(LineOptions(
    geometry: latLngs,
    lineColor: '#FFFFFF',
    lineWidth: 5,
    lineOpacity: 0.5));

    /// lấy các steps chỉ dẫn
    List temp = data.first.legs ?? [];
    if (temp.isNotEmpty) {
    List steps = temp.first['steps'] ?? [];
    final propertiesDriving = state.propertiesDriving!.copyWith(
    listSteps: steps
    .map<StepEntity>((e) =>
    StepModel.fromJson(e as Map<String, dynamic>).toEntity())
    .toList(),
    );
    emit(state.copyWith(propertiesDriving: propertiesDriving));
    }
    });
    }

 * */
}
