import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/core/layout/bottom_nav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormLogin extends StatefulHookConsumerWidget {
  const FormLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormLoginState();
}

class _FormLoginState extends ConsumerState<FormLogin> {
  @override
  Widget build(BuildContext context) {
    var showPass = useState(false);
    var email = useTextEditingController();
    var pass = useTextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              label: Text("Email"),
            ),
          ),
          SizedBox(height: gap),
          TextField(
            controller: pass,
            obscureText: !showPass.value,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  showPass.value = !showPass.value;
                },
                icon: Icon(
                    showPass.value ? Icons.visibility : Icons.visibility_off),
              ),
              label: Text("Password"),
            ),
          ),
          SizedBox(
            height: gap,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Lupa Password?"),
            ),
          ),
          SizedBox(
            height: gap * 3,
          ),
          SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    // context.go("/");
                    ApiService().login(email.text, pass.text).then((v) {
                      if (v) {
                        ref.read(CurrentNavIndexProvider.notifier).setIdx(0);
                        context.go("/");
                      }
                    });
                  },
                  child: Text("Sign In"))),
          SizedBox(
            height: gap * 3,
          ),
          // Row(children: [
          //   Expanded(
          //       child: Padding(
          //     padding: EdgeInsets.only(right: gap * 2),
          //     child: Divider(
          //       color: Colors.black,
          //     ),
          //   )),
          // //   Text("atau"),
          // //   Expanded(
          // //       child: Padding(
          // //     padding: EdgeInsets.only(left: gap * 2),
          // //     child: Divider(
          // //       color: Colors.black,
          // //     ),
          // //   )),
          // // ]),
          // // SizedBox(
          // //   height: gap * 3,
          // // ),
          // // OutlinedButton.icon(
          // //     style: OutlinedButton.styleFrom(
          // //         padding: EdgeInsets.all(gap * 2),
          // //         backgroundColor: Colors.white,
          // //         foregroundColor: Colors.black),
          // //     icon: Image.asset(
          // //         height: gap * 2, width: gap * 2, "assets/icons/google.png"),
          // //     onPressed: () {
          // //       context.go("/");
          // //     },
          // //     label: Text("Google"))
        ],
      ),
    );
  }
}
