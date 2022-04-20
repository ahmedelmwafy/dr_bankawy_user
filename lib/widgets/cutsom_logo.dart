import 'package:dr_bankawy/constants.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThiredColor,
      child: Column(
        children: const [
          Image(
            image: AssetImage('images/icons/buyicon.png'),
          ),
          Text(
            'دليلك الاول',
          ),
          Text(
            'في عالم القروض',
          )
        ],
      ),
    );
  }
}
