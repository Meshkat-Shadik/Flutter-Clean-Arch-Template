import 'package:clean_arch/core/networking/url_config.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class AppDiModule {
  @singleton
  Dio createDio() => Dio(BaseOptions(
        baseUrl: AppConfig.BASE_URL,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 120),
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
      ))
        ..interceptors.add(
          LogInterceptor(
            responseBody: true,
          ),
        );
}
