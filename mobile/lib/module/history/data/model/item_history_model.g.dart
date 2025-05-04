// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemHistoryModelImpl _$$ItemHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemHistoryModelImpl(
      product_id: (json['product_id'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      subtotal: json['subtotal'] as String? ?? "",
      product_name: json['product_name'] as String? ?? "",
      price: json['price'] as String? ?? "",
    );

Map<String, dynamic> _$$ItemHistoryModelImplToJson(
        _$ItemHistoryModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'product_name': instance.product_name,
      'price': instance.price,
    };
