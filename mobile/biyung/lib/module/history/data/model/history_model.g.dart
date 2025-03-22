// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      customer_name: json['customer_name'] as String? ?? "",
      special_requests: json['special_requests'] as String? ?? "",
      total_price: json['total_price'] as String? ?? "",
      order_date: json['order_date'] as String? ?? "",
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ItemHistoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customer_name,
      'special_requests': instance.special_requests,
      'total_price': instance.total_price,
      'order_date': instance.order_date,
      'items': instance.items,
    };
