// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      ratingAvg: (json['ratingAvg'] as num?)?.toDouble() ?? 0.0,
      locale: json['locale'] as String? ?? 'en',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone': instance.phone,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'ratingAvg': instance.ratingAvg,
      'locale': instance.locale,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.buyer: 'buyer',
  UserRole.seller: 'seller',
  UserRole.rider: 'rider',
  UserRole.admin: 'admin',
};
