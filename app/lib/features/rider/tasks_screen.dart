import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/delivery.dart';
import '../../providers/providers.dart';

final riderTasksProvider = FutureProvider.family<List<Delivery>, String>((ref, riderId) async {
  final riderService = ref.watch(riderServiceProvider);
  return await riderService.getTasks(riderId);
});

final riderAvailabilityProvider = StateProvider<bool>((ref) => false);

class RiderTasksScreen extends ConsumerWidget {
  const RiderTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const riderId = 'rider-1-id';  // Mock rider ID
    final tasksAsync = ref.watch(riderTasksProvider(riderId));
    final isAvailable = ref.watch(riderAvailabilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  isAvailable ? 'Available' : 'Offline',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isAvailable,
                  onChanged: (value) async {
                    try {
                      final riderService = ref.read(riderServiceProvider);
                      await riderService.updatePresence(
                        riderId,
                        value,
                        lat: 31.5,  // Mock location
                        lng: 74.3,
                      );
                      ref.read(riderAvailabilityProvider.notifier).state = value;
                      
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              value ? 'You are now available' : 'You are now offline',
                            ),
                          ),
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
                ),
              ],
            ),
          ),
        ],
      ),
      body: tasksAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delivery_dining, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No active tasks',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Turn on availability to receive tasks',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return _TaskCard(task: task);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.refresh(riderTasksProvider(riderId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final Delivery task;

  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.push('/rider/task/${task.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Task #${task.id.substring(0, 8)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Chip(
                    label: Text(task.status.name),
                    backgroundColor: _getStatusColor(task.status),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('${task.distanceKm?.toStringAsFixed(1) ?? '—'} km'),
                  const SizedBox(width: 16),
                  const Icon(Icons.money, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text('PKR ${task.feePk}'),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.push('/rider/task/${task.id}'),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('View Details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(DeliveryStatus status) {
    switch (status) {
      case DeliveryStatus.assigned:
        return Colors.blue.shade100;
      case DeliveryStatus.enRoutePickup:
      case DeliveryStatus.pickedUp:
      case DeliveryStatus.enRouteDrop:
        return Colors.purple.shade100;
      case DeliveryStatus.delivered:
      case DeliveryStatus.confirmed:
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
    }
  }
}

