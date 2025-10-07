// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Delivery _$DeliveryFromJson(Map<String, dynamic> json) {
  return _Delivery.fromJson(json);
}

/// @nodoc
mixin _$Delivery {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String? get riderId => throw _privateConstructorUsedError;
  DeliveryStatus get status => throw _privateConstructorUsedError;
  double? get pickupLat => throw _privateConstructorUsedError;
  double? get pickupLng => throw _privateConstructorUsedError;
  double? get dropLat => throw _privateConstructorUsedError;
  double? get dropLng => throw _privateConstructorUsedError;
  double? get distanceKm => throw _privateConstructorUsedError;
  int get feePk => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Delivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCopyWith<Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res, Delivery>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String? riderId,
      DeliveryStatus status,
      double? pickupLat,
      double? pickupLng,
      double? dropLat,
      double? dropLng,
      double? distanceKm,
      int feePk,
      DateTime createdAt});
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res, $Val extends Delivery>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? riderId = freezed,
    Object? status = null,
    Object? pickupLat = freezed,
    Object? pickupLng = freezed,
    Object? dropLat = freezed,
    Object? dropLng = freezed,
    Object? distanceKm = freezed,
    Object? feePk = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      riderId: freezed == riderId
          ? _value.riderId
          : riderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      pickupLat: freezed == pickupLat
          ? _value.pickupLat
          : pickupLat // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLng: freezed == pickupLng
          ? _value.pickupLng
          : pickupLng // ignore: cast_nullable_to_non_nullable
              as double?,
      dropLat: freezed == dropLat
          ? _value.dropLat
          : dropLat // ignore: cast_nullable_to_non_nullable
              as double?,
      dropLng: freezed == dropLng
          ? _value.dropLng
          : dropLng // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      feePk: null == feePk
          ? _value.feePk
          : feePk // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryImplCopyWith<$Res>
    implements $DeliveryCopyWith<$Res> {
  factory _$$DeliveryImplCopyWith(
          _$DeliveryImpl value, $Res Function(_$DeliveryImpl) then) =
      __$$DeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String? riderId,
      DeliveryStatus status,
      double? pickupLat,
      double? pickupLng,
      double? dropLat,
      double? dropLng,
      double? distanceKm,
      int feePk,
      DateTime createdAt});
}

/// @nodoc
class __$$DeliveryImplCopyWithImpl<$Res>
    extends _$DeliveryCopyWithImpl<$Res, _$DeliveryImpl>
    implements _$$DeliveryImplCopyWith<$Res> {
  __$$DeliveryImplCopyWithImpl(
      _$DeliveryImpl _value, $Res Function(_$DeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? riderId = freezed,
    Object? status = null,
    Object? pickupLat = freezed,
    Object? pickupLng = freezed,
    Object? dropLat = freezed,
    Object? dropLng = freezed,
    Object? distanceKm = freezed,
    Object? feePk = null,
    Object? createdAt = null,
  }) {
    return _then(_$DeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      riderId: freezed == riderId
          ? _value.riderId
          : riderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      pickupLat: freezed == pickupLat
          ? _value.pickupLat
          : pickupLat // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLng: freezed == pickupLng
          ? _value.pickupLng
          : pickupLng // ignore: cast_nullable_to_non_nullable
              as double?,
      dropLat: freezed == dropLat
          ? _value.dropLat
          : dropLat // ignore: cast_nullable_to_non_nullable
              as double?,
      dropLng: freezed == dropLng
          ? _value.dropLng
          : dropLng // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceKm: freezed == distanceKm
          ? _value.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double?,
      feePk: null == feePk
          ? _value.feePk
          : feePk // ignore: cast_nullable_to_non_nullable
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
class _$DeliveryImpl implements _Delivery {
  const _$DeliveryImpl(
      {required this.id,
      required this.orderId,
      this.riderId,
      required this.status,
      this.pickupLat,
      this.pickupLng,
      this.dropLat,
      this.dropLng,
      this.distanceKm,
      this.feePk = 0,
      required this.createdAt});

  factory _$DeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String? riderId;
  @override
  final DeliveryStatus status;
  @override
  final double? pickupLat;
  @override
  final double? pickupLng;
  @override
  final double? dropLat;
  @override
  final double? dropLng;
  @override
  final double? distanceKm;
  @override
  @JsonKey()
  final int feePk;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Delivery(id: $id, orderId: $orderId, riderId: $riderId, status: $status, pickupLat: $pickupLat, pickupLng: $pickupLng, dropLat: $dropLat, dropLng: $dropLng, distanceKm: $distanceKm, feePk: $feePk, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.riderId, riderId) || other.riderId == riderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pickupLat, pickupLat) ||
                other.pickupLat == pickupLat) &&
            (identical(other.pickupLng, pickupLng) ||
                other.pickupLng == pickupLng) &&
            (identical(other.dropLat, dropLat) || other.dropLat == dropLat) &&
            (identical(other.dropLng, dropLng) || other.dropLng == dropLng) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.feePk, feePk) || other.feePk == feePk) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, riderId, status,
      pickupLat, pickupLng, dropLat, dropLng, distanceKm, feePk, createdAt);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      __$$DeliveryImplCopyWithImpl<_$DeliveryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryImplToJson(
      this,
    );
  }
}

abstract class _Delivery implements Delivery {
  const factory _Delivery(
      {required final String id,
      required final String orderId,
      final String? riderId,
      required final DeliveryStatus status,
      final double? pickupLat,
      final double? pickupLng,
      final double? dropLat,
      final double? dropLng,
      final double? distanceKm,
      final int feePk,
      required final DateTime createdAt}) = _$DeliveryImpl;

  factory _Delivery.fromJson(Map<String, dynamic> json) =
      _$DeliveryImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String? get riderId;
  @override
  DeliveryStatus get status;
  @override
  double? get pickupLat;
  @override
  double? get pickupLng;
  @override
  double? get dropLat;
  @override
  double? get dropLng;
  @override
  double? get distanceKm;
  @override
  int get feePk;
  @override
  DateTime get createdAt;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
