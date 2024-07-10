import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  final List<int> _seletedItems = [];

  List<int> get seletedItems => _seletedItems;

  void addItem(int value) {
    _seletedItems.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _seletedItems.remove(value);
    notifyListeners();
  }
}
