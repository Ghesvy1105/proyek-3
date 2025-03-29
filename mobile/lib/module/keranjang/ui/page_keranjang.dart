import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/common_utils.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/core/layout/themedata.dart';
import 'package:biyung/core/route/router.dart';
import 'package:biyung/module/history/data/history_state.dart';
import 'package:biyung/module/keranjang/keranjang_state.dart';
import 'package:biyung/module/keranjang/ui/list_keranjang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageKeranjang extends StatefulHookConsumerWidget {
  const PageKeranjang({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageKeranjangState();
}

class _PageKeranjangState extends ConsumerState<PageKeranjang> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(listKeranjangProvider.notifier).getKeranjang();
  }

  @override
  Widget build(BuildContext context) {
    var summary = ref.watch(summaryProvider);
    var nama = useTextEditingController();
    var reque = useTextEditingController();
    var meja = useTextEditingController();
    return Container(
      padding: EdgeInsets.all(gap),
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.06,
          ),
          Text(
            "Informasi Pesanan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: gap * 3,
          ),
          Text("Catatan"),
          TextField(
            controller: reque,
            decoration: InputDecoration(
                suffixStyle: TextStyle(color: warnaTri),
                suffixText: "Ubah",
                // suffix: TextButton(onPressed: () {}, child: Text("Ubah")),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white),
          ),
          Text("No Meja"),
          TextField(
            controller: meja,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white),
          ),
          SizedBox(
            height: gap * 5,
          ),
          Text(
            "Daftar Pesanan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: gap * 3,
          ),
          Expanded(child: ListKeranjang()),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(gap * 2),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Jumlah Item"), Text(summary.pcs.toString())],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jumlah Item"),
                    Text(summary.harga.toString()),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      if (meja.text == "") {
                        CommonUtils().showMessage("Mohon Isi Nomor Meja");
                      } else {
                        ApiService()
                            .checkout(int.parse(meja.text), reque.text)
                            .then((v) {
                          if (v != 0) {
                            ref.read(historyProvider.notifier).setId(v);
                            ref.read(summaryProvider.notifier).clear();
                            ref
                                .read(listKeranjangProvider.notifier)
                                .getKeranjang();
                            context.push("/konfirmasi");
                          }
                        });
                      }
                    },
                    child: Text("Pesan Sekarang"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(gap * 2)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
