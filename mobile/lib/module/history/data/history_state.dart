import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/module/history/data/model/history_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../menu/data/menu_model.dart';

final listHistoryProvider =
    FutureProvider.autoDispose<List<HistoryModel>>((ref) async {
  var res = await ApiService().listHistory();
  return res;
});

class HistoryState extends Notifier<HistoryModel> {
  @override
  HistoryModel build() {
    return HistoryModel();
  }

  setData(HistoryModel m) {
    state = m;
  }
    setId(int m) {
    state = state.copyWith(id: m);
  }
}

final historyProvider =
    NotifierProvider<HistoryState, HistoryModel>(HistoryState.new);
