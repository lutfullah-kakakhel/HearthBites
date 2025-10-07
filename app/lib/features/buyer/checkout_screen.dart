import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/order.dart';
import '../../providers/providers.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  bool deliveryRequired = true;
  PaymentMethod paymentMethod = PaymentMethod.cash;
  bool isPlacingOrder = false;

  Future<void> _placeOrder() async {
    setState(() => isPlacingOrder = true);

    try {
      final cartItems = ref.read(cartProvider);
      final currentUser = ref.read(currentUserProvider);
      
      // Use real IDs from database
      final buyerId = currentUser?.id ?? 'b92215d3866f48ffad0565945a6193ce';
      final sellerId = cartItems.first.menuItem.sellerId;
      // Use real address ID from database
      const addressId = '54df3c7e538a4c1fb95b5857a257e6c6';

      final orderCreate = OrderCreate(
        sellerId: sellerId,
        addressId: addressId,
        deliveryRequired: deliveryRequired,
        paymentMethod: paymentMethod,
        items: cartItems
            .map((item) => OrderItemCreate(
                  menuItemId: item.menuItem.id,
                  qty: item.quantity,
                  unitPrice: item.menuItem.pricePk,
                ))
            .toList(),
      );

      final orderService = ref.read(orderServiceProvider);
      final order = await orderService.createOrder(buyerId, orderCreate);

      // Clear cart
      ref.read(cartProvider.notifier).clear();

      if (mounted) {
        // Navigate to order status
        context.go('/buyer/order/${order.id}');
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order placed successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error placing order: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isPlacingOrder = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.read(cartProvider.notifier);
    final totalAmount = cartNotifier.totalAmount;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  RadioListTile<bool>(
                    title: const Text('Delivery'),
                    subtitle: const Text('Get it delivered to your address'),
                    value: true,
                    groupValue: deliveryRequired,
                    onChanged: (value) {
                      setState(() => deliveryRequired = value!);
                    },
                  ),
                  RadioListTile<bool>(
                    title: const Text('Pickup'),
                    subtitle: const Text('Pick it up yourself'),
                    value: false,
                    groupValue: deliveryRequired,
                    onChanged: (value) {
                      setState(() => deliveryRequired = value!);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  RadioListTile<PaymentMethod>(
                    title: const Text('Cash on Delivery'),
                    value: PaymentMethod.cash,
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() => paymentMethod = value!);
                    },
                  ),
                  RadioListTile<PaymentMethod>(
                    title: const Text('Wallet (Coming Soon)'),
                    value: PaymentMethod.wallet,
                    groupValue: paymentMethod,
                    onChanged: null,  // Disabled for MVP
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'PKR $totalAmount',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isPlacingOrder ? null : _placeOrder,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: isPlacingOrder
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(
                        'Place Order',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

