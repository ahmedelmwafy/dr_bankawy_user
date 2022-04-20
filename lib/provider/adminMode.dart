// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier
{
  bool isAdmin =false ;
  changeIsAdmin(bool value )
  {
    isAdmin=value;
    notifyListeners();
  }
}