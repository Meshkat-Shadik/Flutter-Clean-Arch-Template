//for satisfying the Open-Closed Principle
//we implement the UserEntity class

import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto implements User {
  @override
  final int id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String website;

  UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
