import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/menu_item.dart';
import '../../providers/providers.dart';

class MenuFormScreen extends ConsumerStatefulWidget {
  final String? itemId;

  const MenuFormScreen({super.key, this.itemId});

  @override
  ConsumerState<MenuFormScreen> createState() => _MenuFormScreenState();
}

class _MenuFormScreenState extends ConsumerState<MenuFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _photoUrlController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _portionController = TextEditingController();
  bool _isAvailable = true;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _photoUrlController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _portionController.dispose();
    super.dispose();
  }

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final menuService = ref.read(menuServiceProvider);
      const sellerId = 'seller-1-id';  // Mock seller ID

      final menuItemCreate = MenuItemCreate(
        name: _nameController.text,
        photoUrl: _photoUrlController.text.isNotEmpty ? _photoUrlController.text : null,
        category: _categoryController.text.isNotEmpty ? _categoryController.text : null,
        pricePk: int.parse(_priceController.text),
        portion: _portionController.text.isNotEmpty ? _portionController.text : null,
        isAvailable: _isAvailable,
      );

      if (widget.itemId == null) {
        await menuService.createMenuItem(sellerId, menuItemCreate);
      } else {
        await menuService.updateMenuItem(
          widget.itemId!,
          menuItemCreate.toJson(),
        );
      }

      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.itemId == null ? 'Item created' : 'Item updated'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.itemId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Menu Item' : 'Add Menu Item'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                hintText: 'Chicken Biryani',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter item name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _photoUrlController,
              decoration: const InputDecoration(
                labelText: 'Photo URL (optional)',
                hintText: 'https://...',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category (optional)',
                hintText: 'Main Course',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price (PKR)',
                hintText: '450',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter price';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _portionController,
              decoration: const InputDecoration(
                labelText: 'Portion (optional)',
                hintText: '1 plate (500g)',
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Available'),
              value: _isAvailable,
              onChanged: (value) {
                setState(() => _isAvailable = value);
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveItem,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: _isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        isEditing ? 'Update Item' : 'Create Item',
                        style: const TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

