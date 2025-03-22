import 'package:biyung/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/history_state.dart';

class PageDetailHistory extends ConsumerStatefulWidget {
  const PageDetailHistory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PageDetailHistoryState();
}

class _PageDetailHistoryState extends ConsumerState<PageDetailHistory> {
  @override
  Widget build(BuildContext context) {
    var pesanan = ref.watch(historyProvider);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/blob2.png",
              ))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      size: 25,
                    ),
                    label: Text(
                      "Detail Pemesanan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Biryani',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(gap * 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: gap * 3,
                    ),
                    Text(
                      "Informasi Pemesanan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Biryani',
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(gap * 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama Pelanggan"),
                            Text(
                              pesanan.customer_name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Text("Special Request"),
                            Text(
                              pesanan.special_requests,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Text("Order Date"),
                            Text(
                              pesanan.order_date,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: gap * 3,
                    ),
                    Text(
                      "Daftar Pesanan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Biryani',
                          fontSize: 20),
                    ),
                    for (var d in pesanan.items) ...{
                      Card(
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.all(gap * 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${d.product_name} X ${d.quantity}"),
                              Text("@ Rp. ${d.price.replaceAll(".00", "")}"),
                              Text("Rp. ${d.subtotal}")
                            ],
                          ),
                        ),
                      )
                    }
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
