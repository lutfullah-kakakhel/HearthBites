// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  String get addressId => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  bool get deliveryRequired => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String buyerId,
      String sellerId,
      String addressId,
      OrderStatus status,
      bool deliveryRequired,
      PaymentMethod paymentMethod,
      int totalAmount,
      DateTime createdAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? addressId = null,
    Object? status = null,
    Object? deliveryRequired = null,
    Object? paymentMethod = null,
    Object? totalAmount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      deliveryRequired: null == deliveryRequired
          ? _value.deliveryRequired
          : deliveryRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String buyerId,
      String sellerId,
      String addressId,
      OrderStatus status,
      bool deliveryRequired,
      PaymentMethod paymentMethod,
      int totalAmount,
      DateTime createdAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? addressId = null,
    Object? status = null,
    Object? deliveryRequired = null,
    Object? paymentMethod = null,
    Object? totalAmount = null,
    Object? createdAt = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      deliveryRequired: null == deliveryRequired
          ? _value.deliveryRequired
          : deliveryRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.buyerId,
      required this.sellerId,
      required this.addressId,
      required this.status,
      this.deliveryRequired = false,
      this.paymentMethod = PaymentMethod.cash,
      required this.totalAmount,
      required this.createdAt});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String buyerId;
  @override
  final String sellerId;
  @override
  final String addressId;
  @override
  final OrderStatus status;
  @override
  @JsonKey()
  final bool deliveryRequired;
  @override
  @JsonKey()
  final PaymentMethod paymentMethod;
  @override
  final int totalAmount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Order(id: $id, buyerId: $buyerId, sellerId: $sellerId, addressId: $addressId, status: $status, deliveryRequired: $deliveryRequired, paymentMethod: $paymentMethod, totalAmount: $totalAmount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.deliveryRequired, deliveryRequired) ||
                other.deliveryRequired == deliveryRequired) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, buyerId, sellerId, addressId,
      status, deliveryRequired, paymentMethod, totalAmount, createdAt);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String buyerId,
      required final String sellerId,
      required final String addressId,
      required final OrderStatus status,
      final bool deliveryRequired,
      final PaymentMethod paymentMethod,
      required final int totalAmount,
      required final DateTime createdAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get buyerId;
  @override
  String get sellerId;
  @override
  String get addressId;
  @override
  OrderStatus get status;
  @override
  bool get deliveryRequired;
  @override
  PaymentMethod get paymentMethod;
  @override
  int get totalAmount;
  @override
  DateTime get createdAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemCreate _$OrderItemCreateFromJson(Map<String, dynamic> json) {
  return _OrderItemCreate.fromJson(json);
}

/// @nodoc
mixin _$OrderItemCreate {
  String get menuItemId => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this OrderItemCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCreateCopyWith<OrderItemCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCreateCopyWith<$Res> {
  factory $OrderItemCreateCopyWith(
          OrderItemCreate value, $Res Function(OrderItemCreate) then) =
      _$OrderItemCreateCopyWithImpl<$Res, OrderItemCreate>;
  @useResult
  $Res call({String menuItemId, int qty, int unitPrice});
}

/// @nodoc
class _$OrderItemCreateCopyWithImpl<$Res, $Val extends OrderItemCreate>
    implements $OrderItemCreateCopyWith<$Res> {
  _$OrderItemCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemId = null,
    Object? qty = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemCreateImplCopyWith<$Res>
    implements $OrderItemCreateCopyWith<$Res> {
  factory _$$OrderItemCreateImplCopyWith(_$OrderItemCreateImpl value,
          $Res Function(_$OrderItemCreateImpl) then) =
      __$$OrderItemCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menuItemId, int qty, int unitPrice});
}

/// @nodoc
class __$$OrderItemCreateImplCopyWithImpl<$Res>
    extends _$OrderItemCreateCopyWithImpl<$Res, _$OrderItemCreateImpl>
    implements _$$OrderItemCreateImplCopyWith<$Res> {
  __$$OrderItemCreateImplCopyWithImpl(
      _$OrderItemCreateImpl _value, $Res Function(_$OrderItemCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuItemId = null,
    Object? qty = null,
    Object? unitPrice = null,
  }) {
    return _then(_$OrderItemCreateImpl(
      menuItemId: null == menuItemId
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemCreateImpl implements _OrderItemCreate {
  const _$OrderItemCreateImpl(
      {required this.menuItemId, required this.qty, required this.unitPrice});

  factory _$OrderItemCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemCreateImplFromJson(json);

  @override
  final String menuItemId;
  @override
  final int qty;
  @override
  final int unitPrice;

  @override
  String toString() {
    return 'OrderItemCreate(menuItemId: $menuItemId, qty: $qty, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemCreateImpl &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuItemId, qty, unitPrice);

  /// Create a copy of OrderItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemCreateImplCopyWith<_$OrderItemCreateImpl> get copyWith =>
      __$$OrderItemCreateImplCopyWithImpl<_$OrderItemCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemCreateImplToJson(
      this,
    );
  }
}

abstract class _OrderItemCreate implements OrderItemCreate {
  const factory _OrderItemCreate(
      {required final String menuItemId,
      required final int qty,
      required final int unitPrice}) = _$OrderItemCreateImpl;

  factory _OrderItemCreate.fromJson(Map<String, dynamic> json) =
      _$OrderItemCreateImpl.fromJson;

  @override
  String get menuItemId;
  @override
  int get qty;
  @override
  int get unitPrice;

  /// Create a copy of OrderItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemCreateImplCopyWith<_$OrderItemCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderCreate _$OrderCreateFromJson(Map<String, dynamic> json) {
  return _OrderCreate.fromJson(json);
}

/// @nodoc
mixin _$OrderCreate {
  String get sellerId => throw _privateConstructorUsedError;
  String get addressId => throw _privateConstructorUsedError;
  bool get deliveryRequired => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  List<OrderItemCreate> get items => throw _privateConstructorUsedError;

  /// Serializes this OrderCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateCopyWith<OrderCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateCopyWith<$Res> {
  factory $OrderCreateCopyWith(
          OrderCreate value, $Res Function(OrderCreate) then) =
      _$OrderCreateCopyWithImpl<$Res, OrderCreate>;
  @useResult
  $Res call(
      {String sellerId,
      String addressId,
      bool deliveryRequired,
      PaymentMethod paymentMethod,
      List<OrderItemCreate> items});
}

/// @nodoc
class _$OrderCreateCopyWithImpl<$Res, $Val extends OrderCreate>
    implements $OrderCreateCopyWith<$Res> {
  _$OrderCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? addressId = null,
    Object? deliveryRequired = null,
    Object? paymentMethod = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRequired: null == deliveryRequired
          ? _value.deliveryRequired
          : deliveryRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemCreate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateImplCopyWith<$Res>
    implements $OrderCreateCopyWith<$Res> {
  factory _$$OrderCreateImplCopyWith(
          _$OrderCreateImpl value, $Res Function(_$OrderCreateImpl) then) =
      __$$OrderCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sellerId,
      String addressId,
      bool deliveryRequired,
      PaymentMethod paymentMethod,
      List<OrderItemCreate> items});
}

/// @nodoc
class __$$OrderCreateImplCopyWithImpl<$Res>
    extends _$OrderCreateCopyWithImpl<$Res, _$OrderCreateImpl>
    implements _$$OrderCreateImplCopyWith<$Res> {
  __$$OrderCreateImplCopyWithImpl(
      _$OrderCreateImpl _value, $Res Function(_$OrderCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? addressId = null,
    Object? deliveryRequired = null,
    Object? paymentMethod = null,
    Object? items = null,
  }) {
    return _then(_$OrderCreateImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryRequired: null == deliveryRequired
          ? _value.deliveryRequired
          : deliveryRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemCreate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateImpl implements _OrderCreate {
  const _$OrderCreateImpl(
      {required this.sellerId,
      required this.addressId,
      this.deliveryRequired = false,
      this.paymentMethod = PaymentMethod.cash,
      required final List<OrderItemCreate> items})
      : _items = items;

  factory _$OrderCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateImplFromJson(json);

  @override
  final String sellerId;
  @override
  final String addressId;
  @override
  @JsonKey()
  final bool deliveryRequired;
  @override
  @JsonKey()
  final PaymentMethod paymentMethod;
  final List<OrderItemCreate> _items;
  @override
  List<OrderItemCreate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrderCreate(sellerId: $sellerId, addressId: $addressId, deliveryRequired: $deliveryRequired, paymentMethod: $paymentMethod, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.deliveryRequired, deliveryRequired) ||
                other.deliveryRequired == deliveryRequired) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sellerId,
      addressId,
      deliveryRequired,
      paymentMethod,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of OrderCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateImplCopyWith<_$OrderCreateImpl> get copyWith =>
      __$$OrderCreateImplCopyWithImpl<_$OrderCreateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateImplToJson(
      this,
    );
  }
}

abstract class _OrderCreate implements OrderCreate {
  const factory _OrderCreate(
      {required final String sellerId,
      required final String addressId,
      final bool deliveryRequired,
      final PaymentMethod paymentMethod,
      required final List<OrderItemCreate> items}) = _$OrderCreateImpl;

  factory _OrderCreate.fromJson(Map<String, dynamic> json) =
      _$OrderCreateImpl.fromJson;

  @override
  String get sellerId;
  @override
  String get addressId;
  @override
  bool get deliveryRequired;
  @override
  PaymentMethod get paymentMethod;
  @override
  List<OrderItemCreate> get items;

  /// Create a copy of OrderCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateImplCopyWith<_$OrderCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
