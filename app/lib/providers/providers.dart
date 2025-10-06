import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/services/api_client.dart';
import '../data/services/menu_service.dart';
import '../data/services/order_service.dart';
import '../data/services/rider_service.dart';
import '../data/models/user.dart';
import '../data/models/cart_item.dart';

// Shared Preferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

// API Client
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

// Services
final menuServiceProvider = Provider<MenuService>((ref) {
  return MenuService(ref.watch(apiClientProvider));
});

final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderService(ref.watch(apiClientProvider));
});

final riderServiceProvider = Provider<RiderService>((ref) {
  return RiderService(ref.watch(apiClientProvider));
});

// Current User (mock for MVP - would come from Supabase Auth)
final currentUserProvider = StateProvider<User?>((ref) => null);

// Cart State
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    final existingIndex = state.indexWhere(
      (cartItem) => cartItem.menuItem.id == item.menuItem.id,
    );

    if (existingIndex >= 0) {
      // Update quantity
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            state[i].copyWith(quantity: state[i].quantity + item.quantity)
          else
            state[i],
      ];
    } else {
      // Add new item
      state = [...state, item];
    }
  }

  void removeItem(String menuItemId) {
    state = state.where((item) => item.menuItem.id != menuItemId).toList();
  }

  void updateQuantity(String menuItemId, int quantity) {
    if (quantity <= 0) {
      removeItem(menuItemId);
      return;
    }

    state = [
      for (final item in state)
        if (item.menuItem.id == menuItemId)
          item.copyWith(quantity: quantity)
        else
          item,
    ];
  }

  void clear() {
    state = [];
  }

  int get totalAmount {
    return state.fold(0, (sum, item) => sum + item.totalPrice);
  }
}

// Locale Provider
final localeProvider = StateProvider<String>((ref) {
  // Default to Urdu for PK locale
  return 'ur';
});

