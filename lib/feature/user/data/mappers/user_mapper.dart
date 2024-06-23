import 'package:clean_arch/feature/user/data/dto/user_dto.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';

extension UserMapper on User {
  UserDto toDto() {
    return UserDto(
      id: id,
      name: name,
      username: username,
      email: email,
      phone: phone,
      website: website,
    );
  }
}

extension UserDtoMapper on UserDto {
  User toEntity() {
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      phone: phone,
      website: website,
    );
  }
}

UserDto fromEntity(User user) {
  return UserDto(
    id: user.id,
    name: user.name,
    username: user.username,
    email: user.email,
    phone: user.phone,
    website: user.website,
  );
}

User fromDto(UserDto userDto) {
  return User(
    id: userDto.id,
    name: userDto.name,
    username: userDto.username,
    email: userDto.email,
    phone: userDto.phone,
    website: userDto.website,
  );
}
