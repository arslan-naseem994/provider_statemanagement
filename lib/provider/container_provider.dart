import 'package:flutter/foundation.dart';

class ContainerProvider with ChangeNotifier {
  double _values = 1.0;
  double get value => _values;

  void setValue(double val) {
    _values = val;
    notifyListeners();
  }
}
