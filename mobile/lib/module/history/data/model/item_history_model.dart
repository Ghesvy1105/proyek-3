import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_history_model.freezed.dart';
part 'item_history_model.g.dart';

@freezed
class ItemHistoryModel with _$ItemHistoryModel {
  factory ItemHistoryModel({
    @Default(0) int product_id,
    @Default(0) int quantity,
    @Default("") String subtotal,
    @Default("") String product_name,
    @Default("") String price,
  }) = _ItemHistoryModel;

  factory ItemHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ItemHistoryModelFromJson(json);
}
