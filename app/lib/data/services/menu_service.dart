import '../models/menu_item.dart';
import 'api_client.dart';

class MenuService {
  final ApiClient _apiClient;

  MenuService(this._apiClient);

  Future<List<MenuItem>> getMenuItems({
    String? sellerId,
    bool? isAvailable,
  }) async {
    final response = await _apiClient.dio.get(
      '/menu',
      queryParameters: {
        if (sellerId != null) 'seller_id': sellerId,
        if (isAvailable != null) 'is_available': isAvailable,
      },
    );

    return (response.data as List)
        .map((item) => MenuItem.fromJson(item))
        .toList();
  }

  Future<MenuItem> createMenuItem(
    String sellerId,
    MenuItemCreate menuItem,
  ) async {
    final response = await _apiClient.dio.post(
      '/menu',
      queryParameters: {'seller_id': sellerId},
      data: menuItem.toJson(),
    );

    return MenuItem.fromJson(response.data);
  }

  Future<MenuItem> updateMenuItem(
    String itemId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _apiClient.dio.patch(
      '/menu/$itemId',
      data: updates,
    );

    return MenuItem.fromJson(response.data);
  }

  Future<void> deleteMenuItem(String itemId) async {
    await _apiClient.dio.delete('/menu/$itemId');
  }
}

