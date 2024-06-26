import 'package:clean_arch/core/networking/url_config.dart';
import 'package:clean_arch/feature/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:clean_arch/feature/user/data/mappers/user_mapper.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late UserRemoteDatasource datasource;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: AppConfig.BASE_URL));
    dioAdapter = DioAdapter(
      dio: dio,
      matcher: const FullHttpRequestMatcher(),
    );
    datasource = UserRemoteDatasource(dio); // Pass Dio instance to datasource
  });

  group('getUserById', () {
    test('should return User when the call is successful', () async {
      // Arrange
      const userId = 1;
      const expectedUser = User(
        id: userId,
        name: 'Leanne Graham',
        username: 'Bret',
        email: 'Sincere@april.biz',
        phone: '1-770-736-8031 x56442',
        website: 'hildegard.org',
      );

      // Mock response for successful request
      dioAdapter.onGet(
        '/users/$userId',
        (server) => server.reply(200, UserMapper.toDto(expectedUser).toJson()),
      );

      // Act
      final result = await datasource.getUserById(userId);

      // Assert
      expect(UserMapper.toEntity(result), equals(expectedUser));
    });

    test('should throw DioException when the call fails', () async {
      // Arrange
      const userId = 1;

      // Mock response for failed request
      dioAdapter.onGet(
        '${AppConfig.BASE_URL}/users/$userId',
        (server) => server.reply(500, {"detail": "Unauthorized"}),
      );

      // Act and Assert
      expect(
          () => datasource.getUserById(userId), throwsA(isA<DioException>()));
    });
  });
}
