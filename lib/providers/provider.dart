import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  bool _islogin = false;

  bool get islogin => _islogin;

  set updateLogin(bool status) {
    _islogin = status;
    notifyListeners();
  }
}
