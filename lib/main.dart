import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/provider/adminMode.dart';
import 'package:dr_bankawy/provider/cartItem.dart';
import 'package:dr_bankawy/provider/modelHud.dart';
import 'package:dr_bankawy/provider/userLoginData.dart';
import 'package:dr_bankawy/screens/login/login_screen.dart';
import 'package:dr_bankawy/screens/sign_up/signup_screen.dart';
import 'package:dr_bankawy/screens/user/cart/notificationsScreen.dart';
import 'package:dr_bankawy/screens/user/home/homePage.dart';
import 'package:dr_bankawy/screens/user/product/productInfo.dart';
import 'package:dr_bankawy/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
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
              debugShowCheckedModeBanner: false, home: CustomLoading());
          //   Scaffold(
          //     body: Center(
          //       child: Text('Loading....'),
          //     ),
          //   ),
          // );
        } else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider<UserData>(
                create: (context) => UserData(),
              ),
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
                NotificationsScreen.id: (context) => NotificationsScreen(),
                ProductInfo.id: (context) => const ProductInfo(),
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => const HomePage(),
              },
              theme: ThemeData(
                  fontFamily: 'Tajawal-Regular',
                  scaffoldBackgroundColor: kMainColor,
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.transparent, elevation: 0)),
              builder: (context, child) {
                return Directionality(
                    textDirection: TextDirection.rtl, child: child);
              },
            ),
          );
        }
      },
    );
  }
}
