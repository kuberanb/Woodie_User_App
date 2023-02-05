import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';

class HomeScreenController extends GetxController {
  String? userName;

  Stream<QuerySnapshot> getHomeProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore.collection(productsCollection).snapshots();
  }

  Stream<QuerySnapshot> getSofaProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Sofa")
        .snapshots();
  }

  Stream<QuerySnapshot> getChairProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Chair")
        .snapshots();
  }

  Stream<QuerySnapshot> getTableProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Table")
        .snapshots();
  }

  Stream<QuerySnapshot> getKitchenProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Kitchen")
        .snapshots();
  }

  Stream<QuerySnapshot> getLampProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Lamp")
        .snapshots();
  }

  Stream<QuerySnapshot> getCupboardProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Cupboard")
        .snapshots();
  }

  Stream<QuerySnapshot> getVaseProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Vase")
        .snapshots();
  }

  Stream<QuerySnapshot> getOtherProducts() {
    var firestore = FirebaseFirestore.instance;
    return firestore
        .collection(productsCollection)
        .where("productCategory", isEqualTo: "Others")
        .snapshots();
  }

  // getUserDetails() {
  //   var firestore = FirebaseFirestore.instance;
  //   return firestore
  //       .collection(userCollection)
  //       .where("userEmail", isEqualTo: FirebaseAuth.instance.currentUser!.email)
  //       .snapshots();
  // }
}
