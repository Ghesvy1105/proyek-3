import 'package:biyung/core/API/api_service.dart';
import 'package:biyung/core/constant.dart';
import 'package:biyung/core/route/router.dart';
import 'package:biyung/module/profile/ui/profil_State.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageProfile extends StatefulHookConsumerWidget {
  const PageProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageProfileState();
}

class _PageProfileState extends ConsumerState<PageProfile> {
  @override
  Widget build(BuildContext context) {
    var profil = ref.watch(profilProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0 * 2),
      child: Column(
        children: [
          Text(
            "Profil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Biryani',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 10.0,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          SizedBox(
            height: gap,
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(gap * 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                image: NetworkImage(caturl), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      SizedBox(
                        width: gap * 1.5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profil.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Biryani',
                              ),
                            ),
                            Text(
                              profil.email,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Biryani',
                              ),
                            ),
                            // Text(
                            //   "08981235676",
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     color: Colors.grey,
                            //     fontFamily: 'Biryani',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.push("/edit-profil");
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      context.push("/history");
                    },
                    title: Text("Pesanan"),
                    leading: Icon(Icons.history),
                  ),
                  ListTile(
                    onTap: () {
                      ApiService().logout().then((v) {
                        context.go("/splash");
                      });
                    },
                    title: Text("Sign Out"),
                    leading: Icon(Icons.exit_to_app),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
