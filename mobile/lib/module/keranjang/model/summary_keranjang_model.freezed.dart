// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_keranjang_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryKeranjangModel _$SummaryKeranjangModelFromJson(
    Map<String, dynamic> json) {
  return _SummaryKeranjangModel.fromJson(json);
}

/// @nodoc
mixin _$SummaryKeranjangModel {
  int get harga => throw _privateConstructorUsedError;
  int get pcs => throw _privateConstructorUsedError;

  /// Serializes this SummaryKeranjangModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryKeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryKeranjangModelCopyWith<SummaryKeranjangModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryKeranjangModelCopyWith<$Res> {
  factory $SummaryKeranjangModelCopyWith(SummaryKeranjangModel value,
          $Res Function(SummaryKeranjangModel) then) =
      _$SummaryKeranjangModelCopyWithImpl<$Res, SummaryKeranjangModel>;
  @useResult
  $Res call({int harga, int pcs});
}

/// @nodoc
class _$SummaryKeranjangModelCopyWithImpl<$Res,
        $Val extends SummaryKeranjangModel>
    implements $SummaryKeranjangModelCopyWith<$Res> {
  _$SummaryKeranjangModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryKeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? harga = null,
    Object? pcs = null,
  }) {
    return _then(_value.copyWith(
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      pcs: null == pcs
          ? _value.pcs
          : pcs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryKeranjangModelImplCopyWith<$Res>
    implements $SummaryKeranjangModelCopyWith<$Res> {
  factory _$$SummaryKeranjangModelImplCopyWith(
          _$SummaryKeranjangModelImpl value,
          $Res Function(_$SummaryKeranjangModelImpl) then) =
      __$$SummaryKeranjangModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int harga, int pcs});
}

/// @nodoc
class __$$SummaryKeranjangModelImplCopyWithImpl<$Res>
    extends _$SummaryKeranjangModelCopyWithImpl<$Res,
        _$SummaryKeranjangModelImpl>
    implements _$$SummaryKeranjangModelImplCopyWith<$Res> {
  __$$SummaryKeranjangModelImplCopyWithImpl(_$SummaryKeranjangModelImpl _value,
      $Res Function(_$SummaryKeranjangModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryKeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? harga = null,
    Object? pcs = null,
  }) {
    return _then(_$SummaryKeranjangModelImpl(
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      pcs: null == pcs
          ? _value.pcs
          : pcs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryKeranjangModelImpl implements _SummaryKeranjangModel {
  _$SummaryKeranjangModelImpl({this.harga = 0, this.pcs = 0});

  factory _$SummaryKeranjangModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryKeranjangModelImplFromJson(json);

  @override
  @JsonKey()
  final int harga;
  @override
  @JsonKey()
  final int pcs;

  @override
  String toString() {
    return 'SummaryKeranjangModel(harga: $harga, pcs: $pcs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryKeranjangModelImpl &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.pcs, pcs) || other.pcs == pcs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, harga, pcs);

  /// Create a copy of SummaryKeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryKeranjangModelImplCopyWith<_$SummaryKeranjangModelImpl>
      get copyWith => __$$SummaryKeranjangModelImplCopyWithImpl<
          _$SummaryKeranjangModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryKeranjangModelImplToJson(
      this,
    );
  }
}

abstract class _SummaryKeranjangModel implements SummaryKeranjangModel {
  factory _SummaryKeranjangModel({final int harga, final int pcs}) =
      _$SummaryKeranjangModelImpl;

  factory _SummaryKeranjangModel.fromJson(Map<String, dynamic> json) =
      _$SummaryKeranjangModelImpl.fromJson;

  @override
  int get harga;
  @override
  int get pcs;

  /// Create a copy of SummaryKeranjangModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryKeranjangModelImplCopyWith<_$SummaryKeranjangModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
