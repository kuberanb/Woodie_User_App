import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/homeScreenController.dart';
import 'package:woodie/core/colorPalettes.dart';

import 'package:woodie/views/homeAndActionMenu/home_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_product_fullscreen.dart';

class CategoryListScreen extends StatelessWidget {
  String categoryName;
  Stream<QuerySnapshot<Object?>>? streamCategorydataFunction;
  CategoryListScreen({
    super.key,
    required this.categoryName,
    required this.streamCategorydataFunction,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        title: Text(
          categoryName,
          style: const TextStyle(
            color: kWhiteColor,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: streamCategorydataFunction,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kWhiteColor,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    //  final productList = snapshot.data;

                    return GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true, // You won't see infinite size error
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.02 * screenHeight,
                      ),
                      itemBuilder: ((context, index) => ProductListTile(
                            fullScreenNavigation: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      SelectedProductFullScreen(
                                        productName: snapshot.data?.docs[index]
                                            ['productName'],
                                        productPrice: snapshot.data?.docs[index]
                                            ['productPrice'],
                                        productDescription: snapshot.data
                                            ?.docs[index]['productDescription'],
                                        productImageList: snapshot
                                            .data?.docs[index]['productImages'],
                                      )),
                                ),
                              );
                            },
                            productName: snapshot.data?.docs[index]
                                ['productName'],
                            productPrice: snapshot.data?.docs[index]
                                ['productPrice'],
                            imageUrl: snapshot.data?.docs[index]
                                ['productImages'][0],
                          )),
                      itemCount: (snapshot.data?.docs.length),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Some Error Occured',
                        style: TextStyle(color: kWhiteColor, fontSize: 18),
                      ),
                    );
                  }
                }),
              ),

              // GridView.builder(
              //   physics:
              //       const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              //   shrinkWrap: true, // You won't see infinite size error
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 0.02 * screenHeight,
              //   ),
              //   itemBuilder: ((context, index) => ProductListTile()),
              //   itemCount: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
