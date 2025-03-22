import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API/api_utils.dart';

class AuthNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  Future<void> check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tk = prefs.getString("TOKEN");
    if (tk?.isNotEmpty ?? false) {
      addToken(tk!);
      state = true;
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, bool>(AuthNotifier.new);
