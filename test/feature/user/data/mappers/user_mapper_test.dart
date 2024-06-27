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

    test('should convert User to UserDto', () {
      final result = UserMapper.toDto(user);

      expect(result.id, user.id);
      expect(result.name, user.name);
      expect(result.username, user.username);
      expect(result.email, user.email);
      expect(result.phone, user.phone);
      expect(result.website, user.website);
    });

    test('should convert UserDto to User', () {
      final result = UserMapper.toEntity(userDto);

      expect(result.id, userDto.id);
      expect(result.name, userDto.name);
      expect(result.username, userDto.username);
      expect(result.email, userDto.email);
      expect(result.phone, userDto.phone);
      expect(result.website, userDto.website);
    });
  });
}
