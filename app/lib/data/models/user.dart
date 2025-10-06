import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  @JsonValue('buyer')
  buyer,
  @JsonValue('seller')
  seller,
  @JsonValue('rider')
  rider,
  @JsonValue('admin')
  admin,
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required UserRole role,
    String? phone,
    required String name,
    String? avatarUrl,
    @Default(0.0) double ratingAvg,
    @Default('en') String locale,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

