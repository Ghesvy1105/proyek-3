import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/module/menu/data/menu_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listMenuProvider = FutureProvider.autoDispose<List<MenuModel>>((ref) async {
  var res = await ApiService().getAllMenu();
  // var res = await ApiService().getRecomendation();
  return res;
});
