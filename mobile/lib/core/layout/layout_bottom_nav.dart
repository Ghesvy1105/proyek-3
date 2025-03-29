import 'package:biyung/core/layout/bottom_nav_state.dart';
import 'package:biyung/module/profile/ui/profil_State.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutBottomNav extends ConsumerStatefulWidget {
  LayoutBottomNav({super.key, required this.geget});
  Widget geget;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LayoutBottomNavState();
}

class _LayoutBottomNavState extends ConsumerState<LayoutBottomNav> {
  // int selected = 0;

  @override
  Widget build(BuildContext context) {
    var selected = ref.watch(CurrentNavIndexProvider);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: Text("Biyung")),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selected,
          onTap: (value) {
            setState(() {
              selected = value;
            });
            ref.read(CurrentNavIndexProvider.notifier).setIdx(value);
            if (value == 0) {
              context.go("/");
            }
            // if (value == 1) {
            //   context.go("/home/notifikasi");
            // }
            // if (value == 2) {
            //   context.go("/konfirmasi");
            // }
            if (value == 2) {
              context.go("/keranjang");
            }
            if (value == 3) {
              ref.read(profilProvider.notifier).get();
              context.go("/profil");
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/home.png",
                height: 24,
                width: 24,
                color: selected == 0 ? Colors.black : Colors.grey,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/chat.png",
                height: 24,
                width: 24,
                color: selected == 1 ? Colors.black : Colors.grey,
              ),
              label: "TTS",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/document.png",
                height: 24,
                width: 24,
                color: selected == 2 ? Colors.black : Colors.grey,
              ),
              label: "Pencarian",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/profil.png",
                height: 24,
                width: 24,
                color: selected == 3 ? Colors.black : Colors.grey,
              ),
              label: "Informasi",
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
                width: double.maxFinite,
                child: Image.asset(
                  "assets/images/blob2.png",
                  fit: BoxFit.fill,
                )),
            widget.geget,

            // Container(
            //   width: MediaQuery.sizeOf(context).width * 15 / 100,
            //   child: DrawerMenu(),
            // ),
          ],
        ),
      ),
    );
  }
}
