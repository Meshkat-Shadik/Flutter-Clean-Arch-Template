//for satisfying the Open-Closed Principle
//we implement the UserEntity class

import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto implements User {
  const factory UserDto({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
