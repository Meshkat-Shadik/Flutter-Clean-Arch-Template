import 'package:clean_arch/feature/user/data/dto/user_dto.dart';
import 'package:clean_arch/feature/user/data/mappers/user_mapper.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserMapper', () {
    const userDto = UserDto(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
    );

    const user = User(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
    );

    test('should convert UserDto to User', () {
      final result = UserMapper.toEntity(userDto);

      expect(result, equals(user));
    });

    test('should convert User to UserDto', () {
      final result = UserMapper.toDto(user);

      expect(result, equals(userDto));
    });
  });

  group('Extensions', () {
    const userDto = UserDto(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
    );

    const user = User(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
    );

    test('should convert UserDto to User using extension', () {
      final result = UserMapper.toEntity(userDto);

      expect(result, equals(user));
    });

    test('should convert User to UserDto using extension', () {
      final result = UserMapper.toDto(user);

      expect(result, equals(userDto));
    });
  });
}
