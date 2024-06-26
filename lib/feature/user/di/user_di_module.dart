import 'package:clean_arch/core/networking/url_config.dart';
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class UserRemoteDatasourceDI {
  @lazySingleton
  UserRemoteDatasource userRemoteDatasource(Dio dio) =>
      UserRemoteDatasource(dio, baseUrl: AppConfig.BASE_URL);
}
