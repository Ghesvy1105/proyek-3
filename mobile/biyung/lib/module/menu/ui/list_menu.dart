import 'package:biyung/module/home/ui/home_state.dart';
import 'package:biyung/module/menu/menu_state.dart';
import 'package:biyung/module/menu/ui/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListMenu extends ConsumerStatefulWidget {
  const ListMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListMenuState();
}

class _ListMenuState extends ConsumerState<ListMenu> {
  @override
  Widget build(BuildContext context) {
    var listMen = ref.watch(listMenuProvider);
    var cat = ref.watch(categoryProvider);
    return listMen.when(
      skipLoadingOnReload: false,
      error: (error, stackTrace) => Text("Opps, Something went wrong"),
      loading: () => CircularProgressIndicator(),
      data: (data) {
        return ListView(
          children: [
            for (var e in data) ...{
              if (cat == "ALL" || cat == e.category) ...{
                ItemMenu(data: e),
              }
            }
          ],
        );
      },
    );
  }
}
