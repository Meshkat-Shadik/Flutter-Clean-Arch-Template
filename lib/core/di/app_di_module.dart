import 'package:clean_arch/core/networking/interceptors/api_interceptor.dart';
import 'package:clean_arch/core/networking/interceptors/logging_interceptor.dart';
import 'package:clean_arch/core/networking/url_config.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class AppDiModule {
  @singleton
  Dio createDio() => Dio(BaseOptions(
        baseUrl: AppConfig.BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
      ))
        ..interceptors.addAll([
          ApiInterceptor(),
          DioLoggingInterceptor(),
        ]);
}
