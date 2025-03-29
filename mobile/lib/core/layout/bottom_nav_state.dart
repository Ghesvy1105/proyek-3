import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentNavIndexNotifier extends StateNotifier<int> {
  CurrentNavIndexNotifier() : super(0);
  setIdx(int idx) {
    state = idx;
  }
}

final CurrentNavIndexProvider =
    StateNotifierProvider<CurrentNavIndexNotifier, int>((ref) {
  return CurrentNavIndexNotifier();
});
