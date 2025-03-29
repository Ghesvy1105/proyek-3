import 'package:biyung/module/menu/data/menu_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'keranjang_model.freezed.dart';
part 'keranjang_model.g.dart';

@freezed
class KeranjangModel with _$KeranjangModel {
  factory KeranjangModel({
    @Default(0) int id,
    @Default(0) int user_id,
    @Default(0) int product_id,
    @Default(0) int quantity,
    MenuModel? product,
  }) = _KeranjangModel;

  factory KeranjangModel.fromJson(Map<String, dynamic> json) =>
      _$KeranjangModelFromJson(json);
}
