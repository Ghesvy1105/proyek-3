import 'package:biyung/core/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../module/singinup/state/signinup_state.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

@override
  void initState() {
     ref.read(authProvider.notifier).check();
  }

   @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (o, n) {
      if (n) {
        context.go("/");
      }
    });
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.maxFinite,
          child: Image.asset("assets/images/biyung.png", fit: BoxFit.cover),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFADDAF6), Color(0xFFC3D1E2)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saung Biung, Pilih Lauk Sesukamu dengan lebih mudah",
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Pesan langsung dari ponselmu,\nlebih cepat dan praktis",
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(counterStateProvider.notifier).state = 0;
                      context.push("/regis");
                    },
                    child: Text("Star Up"),
                  ),
                ),

                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(counterStateProvider.notifier).state = 1;
                      context.push("/regis");
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Sudah Punya Akun?",
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 5.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        children: [
                          TextSpan(
                            text: " Login",
                            style: TextStyle(
                              fontFamily: 'JosefinSans',
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
