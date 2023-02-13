import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/views/forgot_reset_password/forgot_password_screen.dart';

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
    errorSnackBar('Password Reset Link Sent Sucessfully', context);

    } on FirebaseAuthException catch (e) {
      errorSnackBar(e.message.toString(), context);
     // Navigator.of(context).pop();
    }
    Navigator.of(context).pop();
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(
    //       builder: ((context) => const ForgotPasswordScreen()),
    //     ),
    //     (Route<dynamic> route) => false);
  }
}
