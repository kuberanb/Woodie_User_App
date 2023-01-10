import 'package:flutter/material.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/createyourAccount.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/loginyourAccount.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(onClickedSignUp: toggle)
        : CreateYourAccount(onClickedSignIn: toggle);
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
