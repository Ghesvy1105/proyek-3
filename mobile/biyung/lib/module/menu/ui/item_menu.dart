import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/module/keranjang/keranjang_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/menu_model.dart';

class ItemMenu extends StatefulHookConsumerWidget {
  ItemMenu({super.key, required this.data});
  MenuModel data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemMenuState();
}

class _ItemMenuState extends ConsumerState<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              child: Image.network(
                widget.data.image,
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
                      widget.data.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Rp. ${widget.data.price}",
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(0)),
                          onPressed: () {
                            ref
                                .read(summaryProvider.notifier)
                                .addKeranjang(widget.data);
                            ApiService().addKeranjang(widget.data.id);
                          },
                          child: Icon(Icons.add)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
