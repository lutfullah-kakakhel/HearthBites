import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/order.dart';
import '../../providers/providers.dart';

final sellerOrdersProvider = FutureProvider.family<List<Order>, String>((ref, sellerId) async {
  final orderService = ref.watch(orderServiceProvider);
  return await orderService.listOrders(sellerId: sellerId);
});

class OrdersInboxScreen extends ConsumerWidget {
  const OrdersInboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const sellerId = 'seller-1-id';  // Mock seller ID
    final ordersAsync = ref.watch(sellerOrdersProvider(sellerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ordersAsync.when(
        data: (orders) {
          if (orders.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No orders yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return _OrderCard(order: order);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class _OrderCard extends ConsumerWidget {
  final Order order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id.substring(0, 8)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: Text(order.status.name),
                  backgroundColor: _getStatusColor(order.status),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Total: PKR ${order.totalAmount}'),
            Text('Payment: ${order.paymentMethod.name.toUpperCase()}'),
            if (order.deliveryRequired)
              const Text(
                '🚚 Delivery Required',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            const SizedBox(height: 12),
            if (order.status == OrderStatus.pending)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        try {
                          final orderService = ref.read(orderServiceProvider);
                          await orderService.acceptOrder(order.id);
                          ref.invalidate(sellerOrdersProvider);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Order accepted')),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Accept'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        try {
                          final orderService = ref.read(orderServiceProvider);
                          await orderService.rejectOrder(order.id);
                          ref.invalidate(sellerOrdersProvider);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Order rejected')),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.close),
                      label: const Text('Reject'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange.shade100;
      case OrderStatus.accepted:
        return Colors.blue.shade100;
      case OrderStatus.riderAssigned:
      case OrderStatus.pickedUp:
        return Colors.purple.shade100;
      case OrderStatus.delivered:
      case OrderStatus.completed:
        return Colors.green.shade100;
      case OrderStatus.cancelled:
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }
}

