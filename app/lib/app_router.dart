import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/buyer/home_screen.dart';
import 'features/buyer/item_detail_screen.dart';
import 'features/buyer/cart_screen.dart';
import 'features/buyer/checkout_screen.dart';
import 'features/buyer/order_status_screen.dart';
import 'features/seller/dashboard_screen.dart';
import 'features/seller/menu_form_screen.dart';
import 'features/seller/orders_inbox_screen.dart';
import 'features/rider/tasks_screen.dart';
import 'features/rider/task_detail_screen.dart';
import 'features/account/profile_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/buyer/home',
  routes: [
    // Buyer routes
    GoRoute(
      path: '/buyer/home',
      builder: (context, state) => const BuyerHomeScreen(),
    ),
    GoRoute(
      path: '/buyer/item/:id',
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return ItemDetailScreen(itemId: itemId);
      },
    ),
    GoRoute(
      path: '/buyer/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/buyer/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/buyer/order/:id',
      builder: (context, state) {
        final orderId = state.pathParameters['id']!;
        return OrderStatusScreen(orderId: orderId);
      },
    ),
    
    // Seller routes
    GoRoute(
      path: '/seller/dashboard',
      builder: (context, state) => const SellerDashboardScreen(),
    ),
    GoRoute(
      path: '/seller/menu/new',
      builder: (context, state) => const MenuFormScreen(),
    ),
    GoRoute(
      path: '/seller/menu/:id',
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return MenuFormScreen(itemId: itemId);
      },
    ),
    GoRoute(
      path: '/seller/orders',
      builder: (context, state) => const OrdersInboxScreen(),
    ),
    
    // Rider routes
    GoRoute(
      path: '/rider/tasks',
      builder: (context, state) => const RiderTasksScreen(),
    ),
    GoRoute(
      path: '/rider/task/:id',
      builder: (context, state) {
        final taskId = state.pathParameters['id']!;
        return TaskDetailScreen(deliveryId: taskId);
      },
    ),
    
    // Account
    GoRoute(
      path: '/account',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);

