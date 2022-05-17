import 'package:dr_bankawy/constants.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const  CustomLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        backgroundColor: kThiredColor,
        body: Center(
          child: Image.asset(
            'images/icons/buyicon.png',
            height: 100,
          ),
        ));
  }
}
