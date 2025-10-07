// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      buyerId: json['buyerId'] as String,
      sellerId: json['sellerId'] as String,
      addressId: json['addressId'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      deliveryRequired: json['deliveryRequired'] as bool? ?? false,
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['paymentMethod']) ??
              PaymentMethod.cash,
      totalAmount: (json['totalAmount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'addressId': instance.addressId,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'deliveryRequired': instance.deliveryRequired,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.riderRequested: 'rider_requested',
  OrderStatus.riderAssigned: 'rider_assigned',
  OrderStatus.pickedUp: 'picked_up',
  OrderStatus.delivered: 'delivered',
  OrderStatus.readyForPickup: 'ready_for_pickup',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.wallet: 'wallet',
};

_$OrderItemCreateImpl _$$OrderItemCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemCreateImpl(
      menuItemId: json['menuItemId'] as String,
      qty: (json['qty'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderItemCreateImplToJson(
        _$OrderItemCreateImpl instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
    };

_$OrderCreateImpl _$$OrderCreateImplFromJson(Map<String, dynamic> json) =>
    _$OrderCreateImpl(
      sellerId: json['sellerId'] as String,
      addressId: json['addressId'] as String,
      deliveryRequired: json['deliveryRequired'] as bool? ?? false,
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['paymentMethod']) ??
              PaymentMethod.cash,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderCreateImplToJson(_$OrderCreateImpl instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'addressId': instance.addressId,
      'deliveryRequired': instance.deliveryRequired,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'items': instance.items,
    };
