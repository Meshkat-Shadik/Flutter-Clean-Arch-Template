import 'package:clean_arch/core/networking/url_config.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_remote_datasource.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class UserRemoteDatasource {
  factory UserRemoteDatasource(Dio dio, {String baseUrl}) =
      _UserRemoteDatasource;
  @GET('/users/{id}')
  Future<User> getUserById(@Path('id') int id);
}
