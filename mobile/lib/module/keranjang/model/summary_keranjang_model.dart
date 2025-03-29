
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_keranjang_model.freezed.dart';
part 'summary_keranjang_model.g.dart';

@freezed
class SummaryKeranjangModel with _$SummaryKeranjangModel {
  factory SummaryKeranjangModel({
    @Default(0) int harga,
    @Default(0) int pcs
  }) = _SummaryKeranjangModel;
	
  factory SummaryKeranjangModel.fromJson(Map<String, dynamic> json) =>
			_$SummaryKeranjangModelFromJson(json);
}
