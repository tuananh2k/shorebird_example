// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExampleState {
  ExampleEntity? get exampleEntity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExampleStateCopyWith<ExampleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleStateCopyWith<$Res> {
  factory $ExampleStateCopyWith(
          ExampleState value, $Res Function(ExampleState) then) =
      _$ExampleStateCopyWithImpl<$Res, ExampleState>;
  @useResult
  $Res call({ExampleEntity? exampleEntity});
}

/// @nodoc
class _$ExampleStateCopyWithImpl<$Res, $Val extends ExampleState>
    implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleEntity = freezed,
  }) {
    return _then(_value.copyWith(
      exampleEntity: freezed == exampleEntity
          ? _value.exampleEntity
          : exampleEntity // ignore: cast_nullable_to_non_nullable
              as ExampleEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleStateImplCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$$ExampleStateImplCopyWith(
          _$ExampleStateImpl value, $Res Function(_$ExampleStateImpl) then) =
      __$$ExampleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExampleEntity? exampleEntity});
}

/// @nodoc
class __$$ExampleStateImplCopyWithImpl<$Res>
    extends _$ExampleStateCopyWithImpl<$Res, _$ExampleStateImpl>
    implements _$$ExampleStateImplCopyWith<$Res> {
  __$$ExampleStateImplCopyWithImpl(
      _$ExampleStateImpl _value, $Res Function(_$ExampleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exampleEntity = freezed,
  }) {
    return _then(_$ExampleStateImpl(
      exampleEntity: freezed == exampleEntity
          ? _value.exampleEntity
          : exampleEntity // ignore: cast_nullable_to_non_nullable
              as ExampleEntity?,
    ));
  }
}

/// @nodoc

class _$ExampleStateImpl implements _ExampleState {
  _$ExampleStateImpl({this.exampleEntity = null});

  @override
  @JsonKey()
  final ExampleEntity? exampleEntity;

  @override
  String toString() {
    return 'ExampleState(exampleEntity: $exampleEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleStateImpl &&
            (identical(other.exampleEntity, exampleEntity) ||
                other.exampleEntity == exampleEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exampleEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleStateImplCopyWith<_$ExampleStateImpl> get copyWith =>
      __$$ExampleStateImplCopyWithImpl<_$ExampleStateImpl>(this, _$identity);
}

abstract class _ExampleState implements ExampleState {
  factory _ExampleState({final ExampleEntity? exampleEntity}) =
      _$ExampleStateImpl;

  @override
  ExampleEntity? get exampleEntity;
  @override
  @JsonKey(ignore: true)
  _$$ExampleStateImplCopyWith<_$ExampleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
