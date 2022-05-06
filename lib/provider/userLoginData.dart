// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String userEmail;

  addUserEmail(String e) {
    userEmail = e;
    notifyListeners();
  }
}
