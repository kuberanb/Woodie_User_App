import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  Future resetPassword(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(),
          )),
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      errorSnackBar('Password Reset Email Sent', context);
      Navigator.of(context).popUntil((route) => false);
    } on FirebaseAuthException catch (e) {
      errorSnackBar(e.message.toString(), context);
      Navigator.of(context).pop();
    }
  }
}
