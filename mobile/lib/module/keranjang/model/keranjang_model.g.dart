// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keranjang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeranjangModelImpl _$$KeranjangModelImplFromJson(Map<String, dynamic> json) =>
    _$KeranjangModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      user_id: (json['user_id'] as num?)?.toInt() ?? 0,
      product_id: (json['product_id'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      product: json['product'] == null
          ? null
          : MenuModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KeranjangModelImplToJson(
        _$KeranjangModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'product': instance.product,
    };
