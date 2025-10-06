import '../models/order.dart';
import 'api_client.dart';

class OrderService {
  final ApiClient _apiClient;

  OrderService(this._apiClient);

  Future<Order> createOrder(String buyerId, OrderCreate orderData) async {
    final response = await _apiClient.dio.post(
      '/orders',
      queryParameters: {'buyer_id': buyerId},
      data: orderData.toJson(),
    );

    return Order.fromJson(response.data);
  }

  Future<Order> getOrder(String orderId) async {
    final response = await _apiClient.dio.get('/orders/$orderId');
    return Order.fromJson(response.data);
  }

  Future<List<Order>> listOrders({
    String? buyerId,
    String? sellerId,
    String? status,
  }) async {
    final response = await _apiClient.dio.get(
      '/orders',
      queryParameters: {
        if (buyerId != null) 'buyer_id': buyerId,
        if (sellerId != null) 'seller_id': sellerId,
        if (status != null) 'status': status,
      },
    );

    return (response.data as List)
        .map((order) => Order.fromJson(order))
        .toList();
  }

  Future<Order> acceptOrder(String orderId) async {
    final response = await _apiClient.dio.post('/orders/$orderId/accept');
    return Order.fromJson(response.data);
  }

  Future<Order> rejectOrder(String orderId) async {
    final response = await _apiClient.dio.post('/orders/$orderId/reject');
    return Order.fromJson(response.data);
  }

  Future<Map<String, dynamic>> requestRider(String orderId) async {
    final response = await _apiClient.dio.post('/orders/$orderId/request-rider');
    return response.data;
  }

  Future<Map<String, dynamic>> assignRider(String orderId, String riderId) async {
    final response = await _apiClient.dio.post(
      '/orders/$orderId/assign-rider',
      queryParameters: {'rider_id': riderId},
    );
    return response.data;
  }
}

