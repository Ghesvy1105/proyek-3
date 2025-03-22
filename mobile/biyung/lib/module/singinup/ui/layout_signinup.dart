import 'package:biyung/core/constant.dart';
import 'package:biyung/module/singinup/state/signinup_state.dart';
import 'package:biyung/module/singinup/ui/form_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_login.dart';

class PageRegister extends StatefulHookConsumerWidget {
  const PageRegister({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageRegisterState();
}

class _PageRegisterState extends ConsumerState<PageRegister> {
  @override
  Widget build(BuildContext context) {
    var mode = ref.watch(counterStateProvider);
    // var mode = useState(q);
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.maxFinite,
            child: Image.asset(
              "assets/images/top.png",
              fit: BoxFit.fill,
            )),
        Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.45,
            // color: Colors.red,
            child: Image.asset(
              "assets/images/blob.png",
              fit: BoxFit.cover,
            )),
        Container(
          padding: EdgeInsets.all(gap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.05,
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 40.0)],
                ),
                padding: EdgeInsets.all(0),
              ),
              Container(
                margin: EdgeInsets.only(top: gap * 3),
                child: Text(
                  mode == 0
                      ? "Buat Akun\nBarumu !"
                      : "Selamat Datang\nKembali !",
                  style: TextStyle(
                    fontFamily: 'Biryani',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 0),
                        blurRadius: 30,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/bottom.png"))),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 16,
                  right: 16),
              child: mode == 0 ? FormRegister() : FormLogin()),
        ),
      ],
    );
  }
}
