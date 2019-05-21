import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  bool _islogin = false;
  int _selectedIndex = 0;

  bool get islogin => _islogin;
  int get selectedIndex => _selectedIndex;

  set updateIndex (int newindex){
    _selectedIndex = newindex;
    notifyListeners();
  }

  set updateLogin(bool status) {
    _islogin = status;
    notifyListeners();
  }
}
