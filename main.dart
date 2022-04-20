// ignore_for_file: must_be_immutable

import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/provider/adminMode.dart';
import 'package:dr_bankawy/provider/cartItem.dart';
import 'package:dr_bankawy/provider/modelHud.dart';
import 'package:dr_bankawy/screens/login_screen.dart';
import 'package:dr_bankawy/screens/signup_screen.dart';
import 'package:dr_bankawy/screens/user/cartScreen.dart';
import 'package:dr_bankawy/screens/user/homePage.dart';
import 'package:dr_bankawy/screens/user/productInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;

  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading....'),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                create: (context) => ModelHud(),
              ),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),
              ChangeNotifierProvider<AdminMode>(
                create: (context) => AdminMode(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: isUserLoggedIn ? HomePage.id : LoginScreen.id,
              routes: {
                // OrdersScreen.id: (context) => OrdersScreen(),
                CartScreen.id: (context) => const CartScreen(),
                ProductInfo.id: (context) => const ProductInfo(),
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => const HomePage(),
              },
            ),
          );
        }
      },
    );
  }
}
