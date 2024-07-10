import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImgProvider with ChangeNotifier {
  List<String> images = [
    'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&w=600',
  ];

  double _values = 1.0;
  double get value => _values;
  List<String> get imagess => images;
  void setValue(double val) {
    _values = val;
    notifyListeners();
  }
}
