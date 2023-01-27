import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';

class SearchScreenController extends GetxController {

 var searchedProductList;

  int foundProductLength = 0;

  @override
  void onInit() {
    // TODO: implement onInit
   // searchedProductList =  getHomeProducts();
    super.onInit();
  }

  final searchController = TextEditingController();

  Future getHomeProducts() async{
    var firestore = FirebaseFirestore.instance;
    return firestore.collection(productsCollection).snapshots();
  }

  searchProductsFromFirebase() {
    
   searchedProductList =   FirebaseFirestore.instance
        .collection(productsCollection)
        .where(
          "productName",
          isEqualTo: searchController.text,
        )
        .snapshots();
   return searchedProductList.first;
   // foundProductLength = await searchedProductList.length;
  }
}
