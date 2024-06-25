import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const AppFailure._();

  const factory AppFailure({
    required String message,
    required String name,
  }) = _AppFailure;
}

extension AppFailureCopyWithX on AppFailure {
  AppFailure copyWith({
    String? message,
    String? name,
  }) {
    return AppFailure(
      message: message ?? this.message,
      name: name ?? this.name,
    );
  }
}
