import 'dart:convert' show json, jsonEncode;
import 'dart:ui';

import 'package:biyung/core/constant.dart';
import 'package:biyung/core/layout/themedata.dart';
import 'package:biyung/module/home/ui/home_state.dart';
import 'package:biyung/module/keranjang/keranjang_state.dart';
import 'package:biyung/module/menu/ui/list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class PageHome extends StatefulHookConsumerWidget {
  const PageHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageHomeState();
}

class _PageHomeState extends ConsumerState<PageHome> {
  List<dynamic> menuList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPopularMenus();
  }

  Future<void> fetchPopularMenus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('TOKEN');

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/popular-menus'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        menuList =
            data['data']; // asumsi data['data'] adalah List dari JSON menu
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("Gagal mengambil menu populer: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    var showDetail = ref.watch(showDetailNotifierProvider);
    var cateSelected = ref.watch(categoryProvider);
    var summary = ref.watch(summaryProvider);
    var filterKata = useState("");
    var listKeranjang = ref.listen(listKeranjangProvider, (o, n) {
      if (n.isNotEmpty) {
        var q = 0;
        var h = 0;
        for (var l in n) {
          q += l.quantity;
          h += l.quantity * int.parse(l.product!.price.replaceAll(".00", ""));
        }
        ref.read(summaryProvider.notifier).setKeranjang(q, h);
      }
    });

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(gap * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cari Lauk untuk Makananmu!",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Biryani'),
              ),
              SizedBox(height: gap * 2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(gap * 3),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) =>
                      {ref.read(searchProvider.notifier).setText(value)},
                  onSubmitted: (value) async {
                    final prefs = await SharedPreferences.getInstance();
                    final token = prefs.getString('TOKEN');
                    // print('Token: $token'); // ← CETAK TOKEN KE KONSOLE DEBUG

                    // if (token == null) {
                    //   print('Token not found');
                    //   return;
                    // }
                    await http.post(
                      Uri.parse('http://127.0.0.1:8000/api/log-search'),
                      headers: {
                        'Authorization': 'Bearer $token',
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode({'keyword': value}),
                    );
                    // Lakukan pencarian lokal jika ingin
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Cari Lauk...",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(gap * 3),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(gap * 3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Populer Berdasarkan Pencarian',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: menuList.map((menu) {
                    final imageUrl = menu['image'] ?? '';
                    final name = menu['name'] ?? 'Tanpa Nama';
                    final price = menu['price']?.toString() ?? '0';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  Icon(Icons.broken_image, size: 70),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 70,
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "Rp $price",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Menu',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(categoryProvider.notifier).setCategory("ALL");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          cateSelected == "ALL" ? warnaSecondary : Colors.grey,
                    ),
                    child: Text("Semua"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(categoryProvider.notifier)
                          .setCategory("makanan");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cateSelected == "makanan"
                          ? warnaSecondary
                          : Colors.grey,
                    ),
                    child: Text("Makanan"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(categoryProvider.notifier)
                          .setCategory("minuman");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cateSelected == "minuman"
                          ? warnaSecondary
                          : Colors.grey,
                    ),
                    child: Text("Minuman"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListMenu(),
              )
            ],
          ),
        ),

        // FILTER
        if (showDetail)
          BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(color: Color(0x01000000)),
         ),
        if (summary.harga != 0)
          Align(
        alignment: Alignment.bottomCenter,
        child: Container(
        margin: EdgeInsets.all(gap),
        width: double.maxFinite,
        child: Card(
        elevation: 5,
        color: warnaSecondary,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        child: Container(
        padding: EdgeInsets.symmetric(
        vertical: gap * 2, horizontal: gap * 3),
        child: Row(
        children: [
        Text(
        "${summary.pcs} Items",
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white),
        ),
        Spacer(),
        Text(
        "Rp. ${summary.harga}",
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white),
        )
        ],
        ))),
       ),
      )
      ],
    );
  }
}
