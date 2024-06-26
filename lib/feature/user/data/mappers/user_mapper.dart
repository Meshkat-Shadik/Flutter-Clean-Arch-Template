import 'package:clean_arch/feature/user/data/dto/user_dto.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';

class UserMapper {
  static UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      phone: user.phone,
      website: user.website,
    );
  }

  static User toEntity(UserDto userDto) {
    return User(
      id: userDto.id,
      name: userDto.name,
      username: userDto.username,
      email: userDto.email,
      phone: userDto.phone,
      website: userDto.website,
    );
  }
}
