import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/module/history/data/history_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageKonfirmasiKeranjang extends ConsumerWidget {
  const PageKonfirmasiKeranjang({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.sizeOf(context).height * 0.3,
              padding: EdgeInsets.all(32),
              child: Image.asset("assets/icons/ceklis.png")),
          Text(
            "Pesanan Diterima",
            style: TextStyle(
                fontFamily: 'Biryani',
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 36),
          ),
          SizedBox(
            height: gap,
          ),
          Text(
              "Pesanan mu sudah diterima dan akan segera\ndipersiapkan, silahkan menunggu dengan\nsantuy ya..."),
          SizedBox(
            height: gap * 5,
          ),
          ElevatedButton(
              onPressed: () {
                var bz = ref.read(historyProvider).id;
                ApiService().historyDetail(bz).then((v) {
                  ref.read(historyProvider.notifier).setData(v!);
                  context.push("/detail-pesanan");
                });
              },
              child: Text("Lihat Detail Pesanan")),
          SizedBox(
            height: gap * 2,
          ),
          ElevatedButton(
            onPressed: () {
              context.go("/");
            },
            child: Text("Kembali Ke Home"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}
