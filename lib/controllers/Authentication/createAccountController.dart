import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/main.dart';
import 'package:woodie/models/user_model.dart';

import '../../core/colorPalettes.dart';

class CreateAccountController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

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
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if(FirebaseAuth.instance.currentUser?.uid != null){
      //  await
         sendUserData(context);
      }
      
      errorSnackBar('Created Username and Password', context);
    } on FirebaseAuthException catch (e) {
      print(e);
      errorSnackBar(e.message.toString(), context);
    }

    // navigatorKey.currentState!.popUntil((route) => false);
    Navigator.of(context).pop();
  }

  Future sendUserData(context) async {
    UserModel userModel = UserModel(
      userFullName: fullNameController.text,
      userEmail: emailController.text,
      userId: FirebaseAuth.instance.currentUser!.uid,
      userphoneNumber: int.parse(phoneNumberController.text),
      userPassword: passwordController.text,
    );

    try {
      await FirebaseFirestore.instance 
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toJson());
    } catch (error) {
      errorSnackBar(error.toString(), context);
    }
  }
}
