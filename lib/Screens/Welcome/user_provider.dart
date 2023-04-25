import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userEmail = "";

  String get userEmail => _userEmail;

  void setuserEmail(String userEmail) {
    _userEmail = userEmail;
    notifyListeners();
  }
}
