import 'package:dr_bankawy/screens/drawer/about_us.dart';
import 'package:dr_bankawy/screens/drawer/policy.dart';
import 'package:dr_bankawy/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../login/login_screen.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key key}) : super(key: key);
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('عن التطبيق'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            title: const Text('تواصل معنا'),
            onTap: () {
              launch(('tel://01009523389'));
            },
          ),
          ListTile(
            title: const Text('سياسة الاستخدام'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PolicyPrivicy()));
            },
          ),
          ListTile(
            title: const Text('تسجيل الخروج'),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              await auth.signOut();
              Navigator.popAndPushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
