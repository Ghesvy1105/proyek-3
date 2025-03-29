import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'profil_state.dart';

class PageEditProfil extends StatefulHookConsumerWidget {
  const PageEditProfil({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageEditProfilState();
}

class _PageEditProfilState extends ConsumerState<PageEditProfil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(profilProvider.notifier).get();
  }

  @override
  Widget build(BuildContext context) {
    var profil = ref.watch(profilProvider);
    var txNama = useTextEditingController(text: profil.name);
    var txEmail = useTextEditingController(text: profil.email);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(gap),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: Text(
                      "Edit Profil",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Biryani',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: Card(
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Image.asset("assets/images/blob3.png")),
                    ),
                    Container(
                      padding: EdgeInsets.all(gap * 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(caturl),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          SizedBox(
                            height: gap * 3,
                          ),
                          Text("Nama"),
                          TextField(
                            controller: txNama,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: gap * 2,
                          ),
                          Text("Email"),
                          TextField(
                            controller: txEmail,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: gap * 3,
                          ),
                          Container(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                ApiService()
                                    .editProfil(txEmail.text, txNama.text);
                              },
                              child: Text("Simpan"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
