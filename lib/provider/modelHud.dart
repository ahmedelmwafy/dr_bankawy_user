// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class ModelHud extends ChangeNotifier
{
  bool isLoading =false;

  changeisLoading(bool value)
  {
    isLoading=value;
    notifyListeners();
  }
}