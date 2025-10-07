import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? category,
    @JsonKey(name: 'price_pk') required int pricePk,
    String? portion,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
}

@freezed
class MenuItemCreate with _$MenuItemCreate {
  const factory MenuItemCreate({
    required String name,
    String? photoUrl,
    String? category,
    required int pricePk,
    String? portion,
    @Default(true) bool isAvailable,
  }) = _MenuItemCreate;

  factory MenuItemCreate.fromJson(Map<String, dynamic> json) =>
      _$MenuItemCreateFromJson(json);
}

