// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuModelImpl _$$MenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      price: json['price'] as String? ?? "",
      image: json['image'] as String? ?? "",
      category: json['category'] as String? ?? "",
      in_stock: json['in_stock'] as bool? ?? true,
      searchCount: (json['search_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MenuModelImplToJson(_$MenuModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'category': instance.category,
      'in_stock': instance.in_stock,
      'search_count': instance.searchCount,
    };
