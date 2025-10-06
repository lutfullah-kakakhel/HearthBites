import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rider_requested')
  riderRequested,
  @JsonValue('rider_assigned')
  riderAssigned,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('delivered')
  delivered,
  @JsonValue('ready_for_pickup')
  readyForPickup,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('wallet')
  wallet,
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String buyerId,
    required String sellerId,
    required String addressId,
    required OrderStatus status,
    @Default(false) bool deliveryRequired,
    @Default(PaymentMethod.cash) PaymentMethod paymentMethod,
    required int totalAmount,
    required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItemCreate with _$OrderItemCreate {
  const factory OrderItemCreate({
    required String menuItemId,
    required int qty,
    required int unitPrice,
  }) = _OrderItemCreate;

  factory OrderItemCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderItemCreateFromJson(json);
}

@freezed
class OrderCreate with _$OrderCreate {
  const factory OrderCreate({
    required String sellerId,
    required String addressId,
    @Default(false) bool deliveryRequired,
    @Default(PaymentMethod.cash) PaymentMethod paymentMethod,
    required List<OrderItemCreate> items,
  }) = _OrderCreate;

  factory OrderCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateFromJson(json);
}

