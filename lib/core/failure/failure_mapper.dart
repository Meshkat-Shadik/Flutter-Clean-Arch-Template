import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/failure/local_failure.dart';
import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:dio/dio.dart';

class FailureMapper {
  static AppFailure getFailures(Exception error) {
    if (error is DioException) {
      return NetworkFailure.getDioException(error);
    } else {
      return LocalFailure.fromException(error);
    }
  }
}
