// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_id')
  String get sellerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_pk')
  int get pricePk => throw _privateConstructorUsedError;
  String? get portion => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'seller_id') String sellerId,
      String name,
      @JsonKey(name: 'photo_url') String? photoUrl,
      String? category,
      @JsonKey(name: 'price_pk') int pricePk,
      String? portion,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sellerId = null,
    Object? name = null,
    Object? photoUrl = freezed,
    Object? category = freezed,
    Object? pricePk = null,
    Object? portion = freezed,
    Object? isAvailable = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePk: null == pricePk
          ? _value.pricePk
          : pricePk // ignore: cast_nullable_to_non_nullable
              as int,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
          _$MenuItemImpl value, $Res Function(_$MenuItemImpl) then) =
      __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'seller_id') String sellerId,
      String name,
      @JsonKey(name: 'photo_url') String? photoUrl,
      String? category,
      @JsonKey(name: 'price_pk') int pricePk,
      String? portion,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
      _$MenuItemImpl _value, $Res Function(_$MenuItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sellerId = null,
    Object? name = null,
    Object? photoUrl = freezed,
    Object? category = freezed,
    Object? pricePk = null,
    Object? portion = freezed,
    Object? isAvailable = null,
    Object? createdAt = null,
  }) {
    return _then(_$MenuItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePk: null == pricePk
          ? _value.pricePk
          : pricePk // ignore: cast_nullable_to_non_nullable
              as int,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl(
      {required this.id,
      @JsonKey(name: 'seller_id') required this.sellerId,
      required this.name,
      @JsonKey(name: 'photo_url') this.photoUrl,
      this.category,
      @JsonKey(name: 'price_pk') required this.pricePk,
      this.portion,
      @JsonKey(name: 'is_available') this.isAvailable = true,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'seller_id')
  final String sellerId;
  @override
  final String name;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  final String? category;
  @override
  @JsonKey(name: 'price_pk')
  final int pricePk;
  @override
  final String? portion;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'MenuItem(id: $id, sellerId: $sellerId, name: $name, photoUrl: $photoUrl, category: $category, pricePk: $pricePk, portion: $portion, isAvailable: $isAvailable, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pricePk, pricePk) || other.pricePk == pricePk) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sellerId, name, photoUrl,
      category, pricePk, portion, isAvailable, createdAt);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(
      this,
    );
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem(
          {required final String id,
          @JsonKey(name: 'seller_id') required final String sellerId,
          required final String name,
          @JsonKey(name: 'photo_url') final String? photoUrl,
          final String? category,
          @JsonKey(name: 'price_pk') required final int pricePk,
          final String? portion,
          @JsonKey(name: 'is_available') final bool isAvailable,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'seller_id')
  String get sellerId;
  @override
  String get name;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  String? get category;
  @override
  @JsonKey(name: 'price_pk')
  int get pricePk;
  @override
  String? get portion;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemCreate _$MenuItemCreateFromJson(Map<String, dynamic> json) {
  return _MenuItemCreate.fromJson(json);
}

/// @nodoc
mixin _$MenuItemCreate {
  String get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int get pricePk => throw _privateConstructorUsedError;
  String? get portion => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this MenuItemCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCreateCopyWith<MenuItemCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCreateCopyWith<$Res> {
  factory $MenuItemCreateCopyWith(
          MenuItemCreate value, $Res Function(MenuItemCreate) then) =
      _$MenuItemCreateCopyWithImpl<$Res, MenuItemCreate>;
  @useResult
  $Res call(
      {String name,
      String? photoUrl,
      String? category,
      int pricePk,
      String? portion,
      bool isAvailable});
}

/// @nodoc
class _$MenuItemCreateCopyWithImpl<$Res, $Val extends MenuItemCreate>
    implements $MenuItemCreateCopyWith<$Res> {
  _$MenuItemCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photoUrl = freezed,
    Object? category = freezed,
    Object? pricePk = null,
    Object? portion = freezed,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePk: null == pricePk
          ? _value.pricePk
          : pricePk // ignore: cast_nullable_to_non_nullable
              as int,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemCreateImplCopyWith<$Res>
    implements $MenuItemCreateCopyWith<$Res> {
  factory _$$MenuItemCreateImplCopyWith(_$MenuItemCreateImpl value,
          $Res Function(_$MenuItemCreateImpl) then) =
      __$$MenuItemCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? photoUrl,
      String? category,
      int pricePk,
      String? portion,
      bool isAvailable});
}

/// @nodoc
class __$$MenuItemCreateImplCopyWithImpl<$Res>
    extends _$MenuItemCreateCopyWithImpl<$Res, _$MenuItemCreateImpl>
    implements _$$MenuItemCreateImplCopyWith<$Res> {
  __$$MenuItemCreateImplCopyWithImpl(
      _$MenuItemCreateImpl _value, $Res Function(_$MenuItemCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photoUrl = freezed,
    Object? category = freezed,
    Object? pricePk = null,
    Object? portion = freezed,
    Object? isAvailable = null,
  }) {
    return _then(_$MenuItemCreateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePk: null == pricePk
          ? _value.pricePk
          : pricePk // ignore: cast_nullable_to_non_nullable
              as int,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as String?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemCreateImpl implements _MenuItemCreate {
  const _$MenuItemCreateImpl(
      {required this.name,
      this.photoUrl,
      this.category,
      required this.pricePk,
      this.portion,
      this.isAvailable = true});

  factory _$MenuItemCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemCreateImplFromJson(json);

  @override
  final String name;
  @override
  final String? photoUrl;
  @override
  final String? category;
  @override
  final int pricePk;
  @override
  final String? portion;
  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'MenuItemCreate(name: $name, photoUrl: $photoUrl, category: $category, pricePk: $pricePk, portion: $portion, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemCreateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pricePk, pricePk) || other.pricePk == pricePk) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, photoUrl, category, pricePk, portion, isAvailable);

  /// Create a copy of MenuItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemCreateImplCopyWith<_$MenuItemCreateImpl> get copyWith =>
      __$$MenuItemCreateImplCopyWithImpl<_$MenuItemCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemCreateImplToJson(
      this,
    );
  }
}

abstract class _MenuItemCreate implements MenuItemCreate {
  const factory _MenuItemCreate(
      {required final String name,
      final String? photoUrl,
      final String? category,
      required final int pricePk,
      final String? portion,
      final bool isAvailable}) = _$MenuItemCreateImpl;

  factory _MenuItemCreate.fromJson(Map<String, dynamic> json) =
      _$MenuItemCreateImpl.fromJson;

  @override
  String get name;
  @override
  String? get photoUrl;
  @override
  String? get category;
  @override
  int get pricePk;
  @override
  String? get portion;
  @override
  bool get isAvailable;

  /// Create a copy of MenuItemCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemCreateImplCopyWith<_$MenuItemCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
