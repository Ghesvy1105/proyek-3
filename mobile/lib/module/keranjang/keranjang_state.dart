import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/module/keranjang/model/keranjang_model.dart';
import 'package:biyung/module/keranjang/model/summary_keranjang_model.dart';
import 'package:biyung/module/menu/data/menu_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListKeranjangState extends StateNotifier<List<KeranjangModel>> {
  ListKeranjangState() : super([]);
  getKeranjang() async {
    var res = await ApiService().getKeranjang().then((c) {
      state = c;
    });
    return res;
  }
}

final listKeranjangProvider =
    StateNotifierProvider<ListKeranjangState, List<KeranjangModel>>(
        (ref) => ListKeranjangState());

class SummaryKeranjangState extends StateNotifier<SummaryKeranjangModel> {
  // @override
  // SummaryKeranjangModel build() {
  //   return SummaryKeranjangModel(harga: 0, pcs: 0);
  // }
  SummaryKeranjangState() : super(SummaryKeranjangModel(harga: 0, pcs: 0));

  addKeranjang(MenuModel km) {
    state = state.copyWith(
        harga: (state.harga + int.parse(km.price.replaceAll(".00", ""))),
        pcs: (state.pcs + 1));
  }

  setKeranjang(int qty, int harga) {
    state = state.copyWith(pcs: qty, harga: harga);
  }

  kurangKeranjang(MenuModel km) {
    var pc = (state.pcs - 1);
    var hg = (state.harga + int.parse(km.price.replaceAll(".00", "")));
    if (pc < 0) {
      pc = 0;
    }
    if (hg < 0) {
      hg = 0;
    }
    state = state.copyWith(harga: hg, pcs: pc);
  }

  deleteKeranjang(KeranjangModel km) {
    var pc = (state.pcs - km.quantity);
    var hg = (state.harga -
        km.quantity * int.parse(km.product!.price.replaceAll(".00", "")));
    if (pc < 0) {
      pc = 0;
    }
    if (hg < 0) {
      hg = 0;
    }
    state = state.copyWith(harga: hg, pcs: pc);
  }

  clear() {
    state = SummaryKeranjangModel(harga: 0, pcs: 0);
  }
}

final summaryProvider =
    StateNotifierProvider<SummaryKeranjangState, SummaryKeranjangModel>(
        (ref) => SummaryKeranjangState());
