import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/models/address_model.dart';

class AddressController extends GetxController {
  final fullNameController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final buildingNameController = TextEditingController();
  final roadNameController = TextEditingController();

  // Stream<DocumentSnapshot<Map<String, dynamic>>>

  Stream<List<AddressModel>> getAllAddress() {
    return FirebaseFirestore.instance
        .collection(addressCollection)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection(userAddressCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());
  }
}
