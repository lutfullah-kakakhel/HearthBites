// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      id: json['id'] as String,
      sellerId: json['seller_id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      category: json['category'] as String?,
      pricePk: (json['price_pk'] as num).toInt(),
      portion: json['portion'] as String?,
      isAvailable: json['is_available'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seller_id': instance.sellerId,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'category': instance.category,
      'price_pk': instance.pricePk,
      'portion': instance.portion,
      'is_available': instance.isAvailable,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$MenuItemCreateImpl _$$MenuItemCreateImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemCreateImpl(
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      category: json['category'] as String?,
      pricePk: (json['pricePk'] as num).toInt(),
      portion: json['portion'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$$MenuItemCreateImplToJson(
        _$MenuItemCreateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'category': instance.category,
      'pricePk': instance.pricePk,
      'portion': instance.portion,
      'isAvailable': instance.isAvailable,
    };
