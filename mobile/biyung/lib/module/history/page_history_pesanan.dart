import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/core/route/router.dart';
import 'package:biyung/module/history/data/history_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageHistoryPesanan extends ConsumerStatefulWidget {
  const PageHistoryPesanan({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PageHistoryPesananState();
}

class _PageHistoryPesananState extends ConsumerState<PageHistoryPesanan> {
  @override
  Widget build(BuildContext context) {
    var listHistory = ref.watch(listHistoryProvider);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          "assets/images/blob2.png",
        ))),
        child: Column(
          children: [
            SizedBox(
              height: gap * 2,
            ),
            Container(
              width: double.maxFinite,
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: Text(
                      "History Pemesanan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Biryani',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: listHistory.when(
                    error: (error, stackTrace) => Text(""),
                    loading: () => CircularProgressIndicator(),
                    data: (val) {
                      return ListView(
                        children: [
                          for (var d in val) ...{
                            Card(
                              child: InkWell(
                                onTap: () {
                                  ApiService().historyDetail(d.id).then((v) {
                                    if (v != null) {
                                      ref
                                          .read(historyProvider.notifier)
                                          .setData(v);
                                          context.push("/detail-pesanan");
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: gap * 3, vertical: gap),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ORD-${d.id}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text("Total : Rp. ${d.total_price}"),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          }
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
