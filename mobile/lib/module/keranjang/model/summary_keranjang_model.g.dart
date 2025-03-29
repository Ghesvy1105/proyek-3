// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_keranjang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryKeranjangModelImpl _$$SummaryKeranjangModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryKeranjangModelImpl(
      harga: (json['harga'] as num?)?.toInt() ?? 0,
      pcs: (json['pcs'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SummaryKeranjangModelImplToJson(
        _$SummaryKeranjangModelImpl instance) =>
    <String, dynamic>{
      'harga': instance.harga,
      'pcs': instance.pcs,
    };
