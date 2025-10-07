// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryImpl _$$DeliveryImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      riderId: json['riderId'] as String?,
      status: $enumDecode(_$DeliveryStatusEnumMap, json['status']),
      pickupLat: (json['pickupLat'] as num?)?.toDouble(),
      pickupLng: (json['pickupLng'] as num?)?.toDouble(),
      dropLat: (json['dropLat'] as num?)?.toDouble(),
      dropLng: (json['dropLng'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      feePk: (json['feePk'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DeliveryImplToJson(_$DeliveryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'riderId': instance.riderId,
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'pickupLat': instance.pickupLat,
      'pickupLng': instance.pickupLng,
      'dropLat': instance.dropLat,
      'dropLng': instance.dropLng,
      'distanceKm': instance.distanceKm,
      'feePk': instance.feePk,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.requested: 'requested',
  DeliveryStatus.assigned: 'assigned',
  DeliveryStatus.enRoutePickup: 'en_route_pickup',
  DeliveryStatus.pickedUp: 'picked_up',
  DeliveryStatus.enRouteDrop: 'en_route_drop',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.confirmed: 'confirmed',
};
