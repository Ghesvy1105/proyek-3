// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemHistoryModel _$ItemHistoryModelFromJson(Map<String, dynamic> json) {
  return _ItemHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$ItemHistoryModel {
  int get product_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get subtotal => throw _privateConstructorUsedError;
  String get product_name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  /// Serializes this ItemHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemHistoryModelCopyWith<ItemHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemHistoryModelCopyWith<$Res> {
  factory $ItemHistoryModelCopyWith(
          ItemHistoryModel value, $Res Function(ItemHistoryModel) then) =
      _$ItemHistoryModelCopyWithImpl<$Res, ItemHistoryModel>;
  @useResult
  $Res call(
      {int product_id,
      int quantity,
      int subtotal,
      String product_name,
      String price});
}

/// @nodoc
class _$ItemHistoryModelCopyWithImpl<$Res, $Val extends ItemHistoryModel>
    implements $ItemHistoryModelCopyWith<$Res> {
  _$ItemHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = null,
    Object? quantity = null,
    Object? subtotal = null,
    Object? product_name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      product_name: null == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemHistoryModelImplCopyWith<$Res>
    implements $ItemHistoryModelCopyWith<$Res> {
  factory _$$ItemHistoryModelImplCopyWith(_$ItemHistoryModelImpl value,
          $Res Function(_$ItemHistoryModelImpl) then) =
      __$$ItemHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int product_id,
      int quantity,
      int subtotal,
      String product_name,
      String price});
}

/// @nodoc
class __$$ItemHistoryModelImplCopyWithImpl<$Res>
    extends _$ItemHistoryModelCopyWithImpl<$Res, _$ItemHistoryModelImpl>
    implements _$$ItemHistoryModelImplCopyWith<$Res> {
  __$$ItemHistoryModelImplCopyWithImpl(_$ItemHistoryModelImpl _value,
      $Res Function(_$ItemHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = null,
    Object? quantity = null,
    Object? subtotal = null,
    Object? product_name = null,
    Object? price = null,
  }) {
    return _then(_$ItemHistoryModelImpl(
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      product_name: null == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemHistoryModelImpl implements _ItemHistoryModel {
  _$ItemHistoryModelImpl(
      {this.product_id = 0,
      this.quantity = 0,
      this.subtotal = 0,
      this.product_name = "",
      this.price = ""});

  factory _$ItemHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemHistoryModelImplFromJson(json);

  @override
  @JsonKey()
  final int product_id;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int subtotal;
  @override
  @JsonKey()
  final String product_name;
  @override
  @JsonKey()
  final String price;

  @override
  String toString() {
    return 'ItemHistoryModel(product_id: $product_id, quantity: $quantity, subtotal: $subtotal, product_name: $product_name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemHistoryModelImpl &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.product_name, product_name) ||
                other.product_name == product_name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, product_id, quantity, subtotal, product_name, price);

  /// Create a copy of ItemHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemHistoryModelImplCopyWith<_$ItemHistoryModelImpl> get copyWith =>
      __$$ItemHistoryModelImplCopyWithImpl<_$ItemHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _ItemHistoryModel implements ItemHistoryModel {
  factory _ItemHistoryModel(
      {final int product_id,
      final int quantity,
      final int subtotal,
      final String product_name,
      final String price}) = _$ItemHistoryModelImpl;

  factory _ItemHistoryModel.fromJson(Map<String, dynamic> json) =
      _$ItemHistoryModelImpl.fromJson;

  @override
  int get product_id;
  @override
  int get quantity;
  @override
  int get subtotal;
  @override
  String get product_name;
  @override
  String get price;

  /// Create a copy of ItemHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemHistoryModelImplCopyWith<_$ItemHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
