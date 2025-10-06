import '../models/delivery.dart';
import 'api_client.dart';

class RiderPresence {
  final String riderId;
  final bool isAvailable;
  final DateTime lastSeenAt;
  final double? lat;
  final double? lng;

  RiderPresence({
    required this.riderId,
    required this.isAvailable,
    required this.lastSeenAt,
    this.lat,
    this.lng,
  });

  factory RiderPresence.fromJson(Map<String, dynamic> json) {
    return RiderPresence(
      riderId: json['rider_id'],
      isAvailable: json['is_available'],
      lastSeenAt: DateTime.parse(json['last_seen_at']),
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class RiderService {
  final ApiClient _apiClient;

  RiderService(this._apiClient);

  Future<RiderPresence> updatePresence(
    String riderId,
    bool isAvailable, {
    double? lat,
    double? lng,
  }) async {
    final response = await _apiClient.dio.post(
      '/rider/presence',
      queryParameters: {'rider_id': riderId},
      data: {
        'is_available': isAvailable,
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
      },
    );

    return RiderPresence.fromJson(response.data);
  }

  Future<List<Delivery>> getTasks(String riderId) async {
    final response = await _apiClient.dio.get(
      '/rider/tasks',
      queryParameters: {'rider_id': riderId},
    );

    return (response.data as List)
        .map((task) => Delivery.fromJson(task))
        .toList();
  }

  Future<List<RiderPresence>> getAvailableRiders() async {
    final response = await _apiClient.dio.get('/rider/available');

    return (response.data as List)
        .map((rider) => RiderPresence.fromJson(rider))
        .toList();
  }

  Future<Delivery> updateDeliveryStatus(
    String deliveryId,
    DeliveryStatus status,
  ) async {
    final response = await _apiClient.dio.post(
      '/deliveries/$deliveryId/status',
      data: {'status': status.name},
    );

    return Delivery.fromJson(response.data);
  }
}

