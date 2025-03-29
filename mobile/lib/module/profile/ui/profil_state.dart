import 'package:biyung/core/API/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profil_model.dart';

class ProfilState extends StateNotifier<ProfilModel> {
  ProfilState() : super(ProfilModel());

  get() async {
    ApiService().getProfil().then((r) => state = r);
  }
}

final profilProvider =
    StateNotifierProvider<ProfilState, ProfilModel>((ref) => ProfilState());
