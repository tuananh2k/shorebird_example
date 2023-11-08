part of 'example_bloc.dart';

@freezed
class ExampleState with _$ExampleState {
  factory ExampleState({
    @Default(null) ExampleEntity? exampleEntity,
  }) = _ExampleState;
}
