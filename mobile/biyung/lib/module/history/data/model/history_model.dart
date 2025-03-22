import 'package:biyung/module/history/data/model/item_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  factory HistoryModel(
      {@Default(0) int id,
      @Default("") String customer_name,
      @Default("") String special_requests,
      @Default("") String total_price,
      @Default("") String order_date,
      @Default([]) List<ItemHistoryModel> items}) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
