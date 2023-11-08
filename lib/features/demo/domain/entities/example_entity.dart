class ExampleEntity {
  int? value;

  ExampleEntity({
    this.value,
  });

  ExampleEntity copyWith({int? value}) {
    return ExampleEntity(
      value: value ?? this.value,
    );
  }
}
