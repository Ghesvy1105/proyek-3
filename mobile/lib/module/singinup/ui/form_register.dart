import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/signinup_state.dart';

class FormRegister extends StatefulHookConsumerWidget {
  const FormRegister({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormRegisterState();
}

class _FormRegisterState extends ConsumerState<FormRegister> {
  @override
  Widget build(BuildContext context) {
    var showPass = useState(false);
    var nama = useTextEditingController();
    var email = useTextEditingController();
    var password = useTextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: Text("Nama"),
            ),
          ),
          SizedBox(height: gap),
          TextField(
            controller: email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              label: Text("Email"),
            ),
          ),
          SizedBox(height: gap),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              label: Text("No. Telepon"),
            ),
          ),
          SizedBox(height: gap),
          TextField(
            controller: password,
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
          SizedBox(height: gap),
          TextField(
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
              label: Text("Confirm Password"),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {
                    ApiService()
                        .register(nama.text, email.text, password.text)
                        .then((v) {
                      if (v) {
                        ref.read(counterStateProvider.notifier).state = 1;
                      }
                    });
                  },
                  child: Text("Sign Up")))
        ],
      ),
    );
  }
}
