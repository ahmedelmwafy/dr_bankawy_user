// ignore_for_file: deprecated_member_use, unused_local_variable, must_be_immutable

import 'package:dr_bankawy/provider/modelHud.dart';
import 'package:dr_bankawy/screens/user/home/homePage.dart';
import 'package:dr_bankawy/widgets/custom_textfield.dart';
import 'package:dr_bankawy/widgets/cutsom_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'package:dr_bankawy/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignupScreen';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = Auth();

  SignupScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kThiredColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: height * 0.1,
              ),
              const CustomLogo(),
              SizedBox(
                height: height * 0.1,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .05,
                    ),
                    CustomTextField(
                      controller: usernameController,
                      hint: 'اسم المستخدم',
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextField(
                      controller: emailController,
                      hint: 'البريد الالكتروني',
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hint: 'كلمة المرور',
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Builder(
                        builder: (context) => FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () async {
                            final modelhud =
                                Provider.of<ModelHud>(context, listen: false);
                            modelhud.changeisLoading(true);
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();
                              try {
                                final authResult = await _auth.signUp(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                                modelhud.changeisLoading(false);
                                Navigator.pushNamed(context, HomePage.id);
                              } on PlatformException catch (e) {
                                modelhud.changeisLoading(false);
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(e.message),
                                ));
                              }
                            }
                          },
                          color: kSecondaryColor,
                          child: const Text(
                            'انشاء حساب',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'لا تمتلك حساب ؟',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'الدخول',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
