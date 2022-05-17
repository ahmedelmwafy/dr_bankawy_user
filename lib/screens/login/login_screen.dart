// ignore_for_file: deprecated_member_use
import 'package:dr_bankawy/provider/userLoginData.dart';
import 'package:dr_bankawy/screens/sign_up/signup_screen.dart';
import 'package:dr_bankawy/screens/user/home/homePage.dart';
import 'package:dr_bankawy/widgets/custom_textfield.dart';
import 'package:dr_bankawy/widgets/cutsom_logo.dart';
import 'package:flutter/material.dart';
import 'package:dr_bankawy/constants.dart';
import 'package:dr_bankawy/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:dr_bankawy/provider/modelHud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = Auth();
  bool keepMeLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    UserData providerUserData = Provider.of<UserData>(context);
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: widget.globalKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Spacer(),
                SizedBox(
                  height: height * 0.1,
                ),
                const CustomLogo(),
                // SizedBox(
                //   height: height * 0.1,
                // ),
                Container(
                  decoration: const BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      CustomTextField(
                        controller: emailController,
                        hint: 'البريد الإلكتروني',
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hint: 'كلمة المرور',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                checkColor: kThiredColor,
                                activeColor: kMainColor,
                                value: keepMeLoggedIn,
                                onChanged: (value) {
                                  setState(() {
                                    keepMeLoggedIn = value;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              'تذكرني ',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Builder(
                          builder: (context) => FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {
                              if (keepMeLoggedIn == true) {
                                keepUserLoggedIn();
                              }
                              providerUserData
                                  .addUserEmail(emailController.text);
                              _validate(context);
                            },
                            color: kSecondaryColor,
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(color: kThiredColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'ليس لديك حساب؟ ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SignupScreen.id);
                            },
                            child: const Text(
                              'انشاء حساب',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelhud = Provider.of<ModelHud>(context, listen: false);
    modelhud.changeisLoading(true);
    if (widget.globalKey.currentState.validate()) {
      widget.globalKey.currentState.save();
      try {
        await _auth.signIn(
            emailController.text.trim(), passwordController.text.trim());
        Navigator.pushNamed(context, HomePage.id);
      } catch (e) {
        modelhud.changeisLoading(false);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    } else {
      modelhud.changeisLoading(false);
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong !'),
      ));
    }

    // }
    modelhud.changeisLoading(false);
  }

  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
    preferences.setString(kKeepMyEmail, emailController.text);
  }
}
/*
SizedBox.expand(
          child: Container(
              child: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset(
          "assets/images/1.png",
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
        ),
    SlideInUp(
                duration: Duration(seconds: 2),

            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2-20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Form(
                key: formKey,
                child: ListView(
                  // controller: scrollController,
                  children: [
                    Padding(
                      child: paddingText('اعادة تعيين كلمة السر'),
                      padding: EdgeInsets.only(
                        top: 0,
                      ),
                    ),
                    customTextField(
                        hintText: "كلمة السر الجديدة",
                        obscure: true,
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'من فضلك قم بادخال السر الجديدة';
                          }
                        },
                        labelText: "كلمة السر الجديدة"),
                    customTextField(
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'من فضلك قم بادخال السر الجديدة';
                          }
                        },
                        hintText: "تأكيد كلمة السر الجديدة ",
                        obscure: true,
                        labelText: "تأكيد كلمة السر الجديدة"),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: CustomButton(
                          text: "جاهز",
                          color: kPrimaryColor,
                          page: () {
                                if (!formKey.currentState.validate()) {
                                    return;
                                  }
                            Get.to(ActiveCodeForgetPassword());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
        )
      ]))),
    );
  }
*/
