import 'package:biyung/core/layout/themedata.dart';
import 'package:biyung/core/route/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp.router(
      routerConfig: routerGo,
      theme: themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
