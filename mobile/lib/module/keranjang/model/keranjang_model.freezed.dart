// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keranjang_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KeranjangModel _$KeranjangModelFromJson(Map<String, dynamic> json) {
  return _KeranjangModel.fromJson(json);
}

/// @nodoc
mixin _$KeranjangModel {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get product_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  MenuModel? get product => throw _privateConstructorUsedError;

  /// Serializes this KeranjangModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeranjangModelCopyWith<KeranjangModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeranjangModelCopyWith<$Res> {
  factory $KeranjangModelCopyWith(
          KeranjangModel value, $Res Function(KeranjangModel) then) =
      _$KeranjangModelCopyWithImpl<$Res, KeranjangModel>;
  @useResult
  $Res call(
      {int id, int user_id, int product_id, int quantity, MenuModel? product});

  $MenuModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$KeranjangModelCopyWithImpl<$Res, $Val extends KeranjangModel>
    implements $KeranjangModelCopyWith<$Res> {
  _$KeranjangModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? product_id = null,
    Object? quantity = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as MenuModel?,
    ) as $Val);
  }

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $MenuModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KeranjangModelImplCopyWith<$Res>
    implements $KeranjangModelCopyWith<$Res> {
  factory _$$KeranjangModelImplCopyWith(_$KeranjangModelImpl value,
          $Res Function(_$KeranjangModelImpl) then) =
      __$$KeranjangModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int user_id, int product_id, int quantity, MenuModel? product});

  @override
  $MenuModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$KeranjangModelImplCopyWithImpl<$Res>
    extends _$KeranjangModelCopyWithImpl<$Res, _$KeranjangModelImpl>
    implements _$$KeranjangModelImplCopyWith<$Res> {
  __$$KeranjangModelImplCopyWithImpl(
      _$KeranjangModelImpl _value, $Res Function(_$KeranjangModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? product_id = null,
    Object? quantity = null,
    Object? product = freezed,
  }) {
    return _then(_$KeranjangModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as MenuModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeranjangModelImpl implements _KeranjangModel {
  _$KeranjangModelImpl(
      {this.id = 0,
      this.user_id = 0,
      this.product_id = 0,
      this.quantity = 0,
      this.product});

  factory _$KeranjangModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeranjangModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int user_id;
  @override
  @JsonKey()
  final int product_id;
  @override
  @JsonKey()
  final int quantity;
  @override
  final MenuModel? product;

  @override
  String toString() {
    return 'KeranjangModel(id: $id, user_id: $user_id, product_id: $product_id, quantity: $quantity, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeranjangModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user_id, product_id, quantity, product);

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeranjangModelImplCopyWith<_$KeranjangModelImpl> get copyWith =>
      __$$KeranjangModelImplCopyWithImpl<_$KeranjangModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeranjangModelImplToJson(
      this,
    );
  }
}

abstract class _KeranjangModel implements KeranjangModel {
  factory _KeranjangModel(
      {final int id,
      final int user_id,
      final int product_id,
      final int quantity,
      final MenuModel? product}) = _$KeranjangModelImpl;

  factory _KeranjangModel.fromJson(Map<String, dynamic> json) =
      _$KeranjangModelImpl.fromJson;

  @override
  int get id;
  @override
  int get user_id;
  @override
  int get product_id;
  @override
  int get quantity;
  @override
  MenuModel? get product;

  /// Create a copy of KeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeranjangModelImplCopyWith<_$KeranjangModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
