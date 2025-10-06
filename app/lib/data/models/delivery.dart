import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

enum DeliveryStatus {
  @JsonValue('requested')
  requested,
  @JsonValue('assigned')
  assigned,
  @JsonValue('en_route_pickup')
  enRoutePickup,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('en_route_drop')
  enRouteDrop,
  @JsonValue('delivered')
  delivered,
  @JsonValue('confirmed')
  confirmed,
}

@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required String id,
    required String orderId,
    String? riderId,
    required DeliveryStatus status,
    double? pickupLat,
    double? pickupLng,
    double? dropLat,
    double? dropLng,
    double? distanceKm,
    @Default(0) int feePk,
    required DateTime createdAt,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) => _$DeliveryFromJson(json);
}

