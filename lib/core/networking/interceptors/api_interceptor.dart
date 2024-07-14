// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field
import 'package:clean_arch/core/networking/network_misc.dart';
import 'package:clean_arch/core/utils/colored_logger.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //injection of auth token in header
    //example:
    //? final token = getIt<Storage>().getToken;
    const token = 'Your Token HERE';

    ColoredLogger.Yellow.log('🎯LOG URL PATH: ${options.headers}');
    ColoredLogger.Yellow.log('🔰Content-Type: ${options.contentType}');
    ColoredLogger.Yellow.log('🔰Request method: ${options.toCustomString()}');

    if (options.headers.containsKey(NetworkMisc.tokenField)) {
      if (options.headers[NetworkMisc.tokenField] == true) {
        options.headers.addAll(
          <String, Object?>{
            'Authorization': 'Bearer $token',
          },
        );
      }
      options.headers.remove(NetworkMisc.tokenField);
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    ///
    /// log for knowing which endpoint is called
    /// and what is the response
    /// and what is the status code
    ColoredLogger.Green.log('🎯LOG URL PATH: ${response.requestOptions.uri}');
    ColoredLogger.Green.log('🔟Response status code: ${response.statusCode}');
    ColoredLogger.Magenta.log('🍿Response data: ${response.data}');

    if (response.statusCode != null &&
        (response.statusCode! >= 400 && response.statusCode! <= 599)) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: response.data,
        ),
      );
    }
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    ColoredLogger.Yellow.log(err.message);
    ColoredLogger.Yellow.log(err.requestOptions.uri);
    return handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        message: err.error.toString(),
      ),
    );
  }
}

//custom extension for showing the origin, host
extension RequestOptionsToStringX on RequestOptions {
  String toCustomString() {
    return 'method: $method, path: $path, origin: ${headers["Origin"]}, host: ${headers["Host"]}';
  }
}
