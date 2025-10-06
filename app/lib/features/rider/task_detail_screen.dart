import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/delivery.dart';
import '../../providers/providers.dart';

class TaskDetailScreen extends ConsumerWidget {
  final String deliveryId;

  const TaskDetailScreen({super.key, required this.deliveryId});

  Future<void> _launchNavigation(double? lat, double? lng) async {
    if (lat == null || lng == null) return;
    
    final url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _callNumber(String? phone) async {
    if (phone == null) return;
    
    final url = Uri.parse('tel:$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For simplicity, we'll use a mock delivery here
    // In production, you'd fetch this from the API
    const mockDelivery = Delivery(
      id: 'delivery-1',
      orderId: 'order-1',
      riderId: 'rider-1',
      status: DeliveryStatus.assigned,
      pickupLat: 31.5,
      pickupLng: 74.3,
      dropLat: 31.52,
      dropLng: 74.32,
      distanceKm: 2.5,
      feePk: 100,
      createdAt: '2024-01-01T00:00:00Z',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery #${mockDelivery.id.substring(0, 8)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          label: Text(mockDelivery.status.name),
                          backgroundColor: Colors.blue.shade100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Distance',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${mockDelivery.distanceKm} km',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery Fee',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'PKR ${mockDelivery.feePk}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _launchNavigation(
                  mockDelivery.dropLat,
                  mockDelivery.dropLng,
                ),
                icon: const Icon(Icons.navigation),
                label: const Text('Navigate to Customer'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _callNumber('+923001234567'),
                    icon: const Icon(Icons.phone),
                    label: const Text('Call Buyer'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _callNumber('+923001234568'),
                    icon: const Icon(Icons.phone),
                    label: const Text('Call Seller'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Update Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (mockDelivery.status == DeliveryStatus.assigned)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final riderService = ref.read(riderServiceProvider);
                      await riderService.updateDeliveryStatus(
                        deliveryId,
                        DeliveryStatus.pickedUp,
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Marked as picked up')),
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Mark as Picked Up'),
                ),
              ),
            if (mockDelivery.status == DeliveryStatus.pickedUp)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final riderService = ref.read(riderServiceProvider);
                      await riderService.updateDeliveryStatus(
                        deliveryId,
                        DeliveryStatus.delivered,
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Marked as delivered')),
                        );
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Mark as Delivered'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

