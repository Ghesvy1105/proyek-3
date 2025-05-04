import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShowDetailNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

final showDetailNotifierProvider =
    NotifierProvider<ShowDetailNotifier, bool>(ShowDetailNotifier.new);



class CategoryNotifier extends Notifier<String> {
  @override
  String build() => "ALL";

  void setCategory(String s) => state = s;
}

final categoryProvider =
    NotifierProvider<CategoryNotifier, String>(CategoryNotifier.new);


class SearchNotifier extends Notifier<String> {
  @override
  String build() => "";

  void setText(String s) => state = s;
}

final searchProvider =
    NotifierProvider<SearchNotifier, String>(SearchNotifier.new);

