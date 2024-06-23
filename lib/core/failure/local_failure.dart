import 'package:clean_arch/core/failure/app_failure.dart';

class LocalFailure implements AppFailure {
  @override
  final String name;
  @override
  final String? uriPath;
  @override
  final String message;

  LocalFailure({
    required this.name,
    this.uriPath,
    required this.message,
  });

  factory LocalFailure.fromException(Exception e) {
    return LocalFailure(
      name: e.runtimeType.toString(),
      message: e.toString(),
    );
  }
}
