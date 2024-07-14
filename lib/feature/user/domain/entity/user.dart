import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int? id,
    required String? name,
    required String? username,
    required String? email,
    required String? phone,
    required String? website,
  }) = _User;
}

extension UserCopyWithX on User {
  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
    );
  }
}
