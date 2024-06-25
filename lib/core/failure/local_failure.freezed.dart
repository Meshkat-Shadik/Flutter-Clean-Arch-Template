// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalFailure {
  String get name => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalFailureCopyWith<LocalFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalFailureCopyWith<$Res> {
  factory $LocalFailureCopyWith(
          LocalFailure value, $Res Function(LocalFailure) then) =
      _$LocalFailureCopyWithImpl<$Res, LocalFailure>;
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class _$LocalFailureCopyWithImpl<$Res, $Val extends LocalFailure>
    implements $LocalFailureCopyWith<$Res> {
  _$LocalFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalFailureImplCopyWith<$Res>
    implements $LocalFailureCopyWith<$Res> {
  factory _$$LocalFailureImplCopyWith(
          _$LocalFailureImpl value, $Res Function(_$LocalFailureImpl) then) =
      __$$LocalFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String message});
}

/// @nodoc
class __$$LocalFailureImplCopyWithImpl<$Res>
    extends _$LocalFailureCopyWithImpl<$Res, _$LocalFailureImpl>
    implements _$$LocalFailureImplCopyWith<$Res> {
  __$$LocalFailureImplCopyWithImpl(
      _$LocalFailureImpl _value, $Res Function(_$LocalFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_$LocalFailureImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocalFailureImpl implements _LocalFailure {
  const _$LocalFailureImpl({required this.name, required this.message});

  @override
  final String name;
  @override
  final String message;

  @override
  String toString() {
    return 'LocalFailure(name: $name, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalFailureImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalFailureImplCopyWith<_$LocalFailureImpl> get copyWith =>
      __$$LocalFailureImplCopyWithImpl<_$LocalFailureImpl>(this, _$identity);
}

abstract class _LocalFailure implements LocalFailure {
  const factory _LocalFailure(
      {required final String name,
      required final String message}) = _$LocalFailureImpl;

  @override
  String get name;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LocalFailureImplCopyWith<_$LocalFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
