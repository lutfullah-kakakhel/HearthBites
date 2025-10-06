import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_item.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required MenuItem menuItem,
    required int quantity,
  }) = _CartItem;
  
  const CartItem._();
  
  int get totalPrice => menuItem.pricePk * quantity;
}

