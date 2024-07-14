import 'package:clean_arch/core/networking/network_misc.dart';
import 'package:clean_arch/core/networking/url_config.dart';
import 'package:clean_arch/feature/user/data/dto/user_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'user_remote_datasource.g.dart';

@RestApi(baseUrl: AppConfig.BASE_URL)
abstract class UserRemoteDatasource {
  factory UserRemoteDatasource(Dio dio, {String baseUrl}) =
      _UserRemoteDatasource;
  @GET('/users/{id}')
  @Headers(NetworkMisc.needAuthToken)
  Future<UserDto> getUserById(@Path('id') int id);
}
