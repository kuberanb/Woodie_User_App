import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import "package:flutter/material.dart";
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/cart_model.dart';

class CartController extends GetxController {
  Stream<List<CartModel>> getCartProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(cartCollection)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(userCartCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CartModel.fromJson(doc.data()))
            .toList());
  }

  Future deletecartProduct(String id,BuildContext context) async {
   await FirebaseFirestore.instance
        .collection(cartCollection)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(userCartCollection)
        .doc(id)
        .delete();
        errorSnackBar('Cart Product Deleted Sucessfully', context);
  }
}
