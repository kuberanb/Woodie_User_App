import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/main.dart';

import '../../core/colorPalettes.dart';

class CreateAccountController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool checkboxValue = false;

// checkboxclicked(var val){
//  checkboxValue = val;
// }

  Future signUp(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: kWhiteColor,
            ),
          )),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
    //  errorSnackBar('Created Username and Password', context);
    } on FirebaseAuthException catch (e) {
      print(e);
      errorSnackBar(e.message.toString(), context);
    }

    navigatorKey.currentState!.popUntil((route) => false);
  }
}
