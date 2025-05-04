import 'dart:developer';

import 'package:biyung/core/common_utils.dart';
import 'package:biyung/module/history/data/model/history_model.dart';
import 'package:biyung/module/keranjang/model/keranjang_model.dart';
import 'package:biyung/module/menu/data/menu_model.dart';
import 'package:biyung/module/profile/model/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'api_utils.dart';

class ApiService {
  login(em, password) async {
    var data = {"email": em, "password": password};
    var w = await API.kal().post("http://127.0.0.1:8000/api/login", data: data).then((r) async {
      CommonUtils().showMessage(r.data['message']);
      if (r.data['status']) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("TOKEN", r.data['token']);
        prefs.setString("NAMA", r.data['data']['name']);
        prefs.setString("EMAIL", r.data['data']['email']);

        addToken(r.data['token']);

        return true;
      } else {
        return false;
      }
    });
    return w;
  }

  Future<bool> register(name, em, password) async {
    var data = {"name": name, "email": em, "password": password};
    var w = await API.kal().post("http://127.0.0.1:8000/api/register", data: data).then((r) {
      CommonUtils().showMessage(r.data['message']);
      if (r.data['status']) {
        // addToken(r.data['token']);
        return true;
      } else {
        return false;
      }
    });
    return w;
  }

  Future<List<MenuModel>> getAllMenu() async {
    try {
      var res = await API.kal().get("http://127.0.0.1:8000/api/menu?category=").then((r) {
        // CommonUtils().showMessage(r.data['message']);
        if (r.data['status']) {
          var list = List.from(r.data['data']);
          var q = list.map((e) => MenuModel.fromJson(e)).toList();
          return q;
        } else {
          return [] as List<MenuModel>;
        }
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return [];
    }
  }

  Future<List<MenuModel>> getRecomendation({String search = "", String category = "ALL"}) async {
  // final dio = Dio();
  final response = await API.kal().get('http://127.0.0.1:8000/api/menu', queryParameters: {
    'search': search,
    'category': category,
  });

  if (response.data['status']) {
    final List data = response.data['data'];
    return data.map((json) => MenuModel.fromJson(json)).toList();
  } else {
    return [];
  }
}

Future<void> incrementSearchCount(int id) async {
  try {
    await API.kal().post('http://127.0.0.1:8000/api/menu/$id/increment-search');
  } catch (e) {
    print('Gagal tambah search count: $e');
  }
}


  Future<bool> addKeranjang(int menu) async {
    var data = {"menu_id": menu, "quantity": 1};
    try {
      var res = await API.kal().post("http://127.0.0.1:8000/api/keranjang", data: data).then((r) {
        // CommonUtils().showMessage(r.data['message']);
        return r.data['status'];
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  Future<bool> updateKeranjang(int keranjang, int menu, int qty) async {
    var data = {"menu_id": menu, "quantity": qty};
    try {
      var res =
          await API.kal().post("http://127.0.0.1:8000/api/keranjang/$keranjang", data: data).then((r) {
        // CommonUtils().showMessage(r.data['message']);
        return r.data['status'];
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  Future<bool> hapusKeranjang(int keranjang) async {
    try {
      var res = await API.kal().delete("http://127.0.0.1:8000/api/keranjang/$keranjang").then((r) {
        CommonUtils().showMessage(r.data['message']);
        return r.data['status'];
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  Future<List<KeranjangModel>> getKeranjang() async {
    try {
      var res = await API.kal().get("http://127.0.0.1:8000/api/keranjang").then((r) {
        // CommonUtils().showMessage(r.data['message']);
        if (r.data['status']) {
          var list = List.from(r.data['data']);
          var q = list.map((e) => KeranjangModel.fromJson(e)).toList();
          return q;
        } else {
          return [] as List<KeranjangModel>;
        }
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return [];
    }
  }

  Future<int> checkout(int meja, String reqs) async {
    var data = {"table_number": meja, "special_requests": reqs};
    try {
      var res = await API.kal().post("http://127.0.0.1:8000/api/check-out", data: data).then((r) {
        // CommonUtils().showMessage(r.data['message']);
        return r.data['data']['id'];
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return 0;
    }
  }

  Future<List<HistoryModel>> listHistory() async {
    try {
      var res = await API.kal().get("http://127.0.0.1:8000/api/check-out").then((r) {
        if (r.data['status']) {
          var list = List.from(r.data['data']);
          var q = list.map((e) => HistoryModel.fromJson(e)).toList();
          return q;
        } else {
          return [] as List<HistoryModel>;
        }
      });
      return res;
    } catch (ex) {
      log(ex. toString());
      return [];
    }
  }

  Future<HistoryModel?> historyDetail(int id) async {
    try {
      log(id.toString());
      var res = await API.kal().get("http://127.0.0.1:8000/api/check-out/$id/detail").then((r) {
        if (r.data['status']) {
          var q = HistoryModel.fromJson(r.data['data']);
          return q;
        } else {
          return null;
        }
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return null;
    }
  }

  Future<bool> editProfil(String email, String nama) async {
    try {
      var data = {"name": nama, "email": email};
      var res = await API.kal().post("http://127.0.0.1:8000/api/profile", data: data).then((r) {
        CommonUtils().showMessage(r.data['message']);
        return r.data['status'] ?? false;
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  Future<ProfilModel> getProfil() async {
    try {
      var res = await API.kal().get("http://127.0.0.1:8000/api/profile").then((r) {
        // CommonUtils().showMessage(r.data['message']);
        if (r.data['status']) {
          return ProfilModel.fromJson(r.data['data']);
        } else {
          return ProfilModel();
        }
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return ProfilModel();
    }
  }

  Future<bool> logout() async {
    try {
      var res = await API.kal().post("http://127.0.0.1:8000/api/logout").then((r) {
        CommonUtils().showMessage(r.data['message']);
        return r.data['status'];
      });
      return res;
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }
}
