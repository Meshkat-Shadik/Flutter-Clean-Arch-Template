// ignore_for_file: , depend_on_referenced_packages

import 'package:clean_arch/core/failure/app_failure.dart';
import 'package:clean_arch/core/networking/status_code.dart';
import 'package:dio/dio.dart';

class NetworkFailure implements AppFailure {
  @override
  final String name;
  @override
  final String uriPath;
  @override
  final String message;

  const NetworkFailure({
    required this.name,
    required this.uriPath,
    required this.message,
  });

  static NetworkFailure getDioException(Exception error) {
    if (error is DioException) {
      final message = _handleDioError(error);
      final code = error.response?.statusCode;
      final status = getStatusCode(code);
      final path = error.requestOptions.path;

      return NetworkFailure(
        name: status?.name ?? 'Unrecognized error',
        uriPath: path,
        message: message,
      );
    }
    return const NetworkFailure(
      name: 'Unrecognized error',
      uriPath: '',
      message: 'Unrecognized error',
    );
  }

  // Helper method to handle different types of Dio exceptions
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Timeout occurred while sending or receiving";
      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        final statusCode = getStatusCode(code);

        if (statusCode != null) {
          return statusCode.name;
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        return "No Internet Connection";
      case DioExceptionType.badCertificate:
        return "Internal Server Error";
      case DioExceptionType.connectionError:
        return "Connection Error";
      default:
        return "Unknown Error";
    }
    return "Unknown Error";
  }

  factory NetworkFailure.getException(Exception e) {
    final excep = e as DioException;
    return NetworkFailure(
      name: excep.type.toString(),
      uriPath: excep.requestOptions.path,
      message: excep.toString(),
    );
  }
}
