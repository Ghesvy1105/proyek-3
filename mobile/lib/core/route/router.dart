import 'package:biyung/core/layout/layout_bottom_nav.dart';
import 'package:biyung/core/splashscreen/splashscreen.dart';
import 'package:biyung/module/history/page_detail_history.dart';
import 'package:biyung/module/history/page_history_pesanan.dart';
import 'package:biyung/module/home/ui/page_home.dart';
import 'package:biyung/module/keranjang/ui/page_keranjang.dart';
import 'package:biyung/module/keranjang/ui/page_konfirmasi_keranjang.dart';
import 'package:biyung/module/profile/ui/page_edit_profil.dart';
import 'package:biyung/module/profile/ui/page_profile.dart';
import 'package:biyung/module/singinup/ui/layout_signinup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rNavKey = GlobalKey<NavigatorState>();
final GoRouter routerGo = GoRouter(
  initialLocation: "/splash",
  navigatorKey: rNavKey,
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(body: child),
      routes: [
        GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return SplashScreen();
          },
        ),
        GoRoute(
          path: '/regis',
          builder: (BuildContext context, GoRouterState state) {
            return PageRegister();
          },
        ),
        GoRoute(
          path: '/konfirmasi',
          builder: (BuildContext context, GoRouterState state) {
            return PageKonfirmasiKeranjang();
          },
        ),
        GoRoute(
          path: '/history',
          builder: (BuildContext context, GoRouterState state) {
            return PageHistoryPesanan();
          },
        ),
        GoRoute(
          path: '/edit-profil',
          builder: (BuildContext context, GoRouterState state) {
            return PageEditProfil();
          },
        ),
        GoRoute(
          path: '/detail-pesanan',
          builder: (BuildContext context, GoRouterState state) {
            return PageDetailHistory();
          },
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => LayoutBottomNav(geget: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return PageHome();
          },
        ),
        GoRoute(
          path: '/keranjang',
          builder: (BuildContext context, GoRouterState state) {
            return PageKeranjang();
          },
        ),
        GoRoute(
          path: '/profil',
          builder: (BuildContext context, GoRouterState state) {
            return PageProfile();
          },
        ),
      ],
    ),
  ],
);
