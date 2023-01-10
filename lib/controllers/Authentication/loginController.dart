import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/main.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool checkboxValue = false;

  Future signIn(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: kWhiteColor,
            ),
          )),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      errorSnackBar('Sign In Sucessful', context);
    } on FirebaseAuthException catch (e) {
      print(e);
      errorSnackBar(e.toString(), context);
    }
    Navigator.of(context).pop();

    // navigatorKey.currentState!.popUntil((route) => false);
  }

  Future signOut(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: kWhiteColor,
            ),
          )),
    );

    try {
      await FirebaseAuth.instance.signOut();
      errorSnackBar('Logout Sucessful', context);
    } on FirebaseAuthException catch (e) {
      print(e);
      errorSnackBar(e.message.toString(), context);
    }

    // navigatorKey.currentState!.popUntil((route) => false);
     Navigator.of(context).pop();
     Navigator.of(context).pop();
  }
}
