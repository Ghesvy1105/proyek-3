import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/core/layout/themedata.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../keranjang_state.dart';

class ListKeranjang extends ConsumerStatefulWidget {
  const ListKeranjang({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListKeranjangState();
}

class _ListKeranjangState extends ConsumerState<ListKeranjang> {
  @override
  Widget build(BuildContext context) {
    var listKeranjang = ref.watch(listKeranjangProvider);
    return ListView(
      children: [
        for (var e in listKeranjang) ...{
          Card(
            child: Container(
              padding: EdgeInsets.all(gap * 2),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: e.product == null
                        ? Container(
                            color: Colors.grey,
                          )
                        : Image.network(
                            e.product!.image,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(
                    width: gap * 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            e.product?.name ?? "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "Rp. ${e.product?.price}",
                          ),
                          Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: warnaTri,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: warnaTri,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.all(0),
                                        ),
                                        onPressed: () {
                                          ref
                                              .read(summaryProvider.notifier)
                                              .kurangKeranjang(e.product!);
                                          ApiService()
                                              .updateKeranjang(e.id,
                                                  e.product_id, e.quantity - 1)
                                              .then((v) {
                                            if (v) {
                                              ref
                                                  .read(listKeranjangProvider
                                                      .notifier)
                                                  .getKeranjang();
                                            }
                                          });
                                        },
                                        child: Text(
                                          "-",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 36,
                                      width: 36,
                                      alignment: Alignment.center,
                                      // color: warnaTri,
                                      child: Text(
                                        e.quantity.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.all(0),
                                        ),
                                        onPressed: () {
                                          ref
                                              .read(summaryProvider.notifier)
                                              .addKeranjang(e.product!);
                                          ApiService()
                                              .updateKeranjang(e.id,
                                                  e.product_id, e.quantity + 1)
                                              .then((v) {
                                            if (v) {
                                              ref
                                                  .read(listKeranjangProvider
                                                      .notifier)
                                                  .getKeranjang();
                                            }
                                          });
                                        },
                                        child: Text(
                                          "+",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(summaryProvider.notifier)
                                        .deleteKeranjang(e);
                                    ApiService().hapusKeranjang(e.id).then((v) {
                                      if (v) {
                                        ref
                                            .read(
                                                listKeranjangProvider.notifier)
                                            .getKeranjang();
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        }
      ],
    );
  }
}
