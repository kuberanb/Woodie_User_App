import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:woodie/controllers/cart_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:get/get.dart';
import 'package:woodie/core/constants.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;
    final controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: controller.getCartProducts(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kWhiteColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) => MyCartSingleItem(
                            productName: snapshot.data![index].productName,
                            productPrice: snapshot.data![index].productPrice,
                            productQuantity:
                                snapshot.data![index].productQuantity,
                            productImageUrl: snapshot.data![index].productImage,
                            id: snapshot.data![index].id,
                          )),
                      separatorBuilder: ((context, index) => SizedBox(
                            height: 0.02 * screenHeight,
                          )),
                      itemCount: snapshot.data!.length,
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Cart is Empty',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: Text(
                      'Something Went Wrong',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              }),
            ),

            // const   Spacer(),
            SizedBox(
              height: 0.02 * screenHeight,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 0.142 * screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kListTileColor,
                  border: Border.all(
                    color: kLightWhiteColor,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 0.02 * screenWidth,
                    right: 0.02 * screenWidth,
                    top: 0.02 * screenHeight,
                    bottom: 0.02 * screenHeight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              color: kspecialGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 0.01 * screenHeight,
                          ),
                          const Text(
                            '₹ 50000',
                            style: TextStyle(color: kWhiteColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 0.02 * screenHeight,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 0.2 * screenWidth,
                                height: 0.05 * screenHeight,
                                child: const Center(
                                  child: Text(
                                    'CheckOut',
                                    style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCartSingleItem extends StatelessWidget {
  String id;
  String productName;
  int productPrice;
  int productQuantity;
  String productImageUrl;
  MyCartSingleItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productImageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(CartController());
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: kListTileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 0.16 * screenHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 0.16 * screenHeight,
                        width: 0.3 * screenWidth,

                        decoration: BoxDecoration(
                          color: kListTileColor,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              // 'https://www.ulcdn.net/images/products/162605/slide/666x363/Carven_Lounge_Chair_Grey_1.jpg?1514963528',
                              productImageUrl,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: kLightWhiteColor),
                        // height: 0.16 * screenHeight,
                        // width: 0.3 * screenWidth,
                        // child: Image.network(
                        //   // 'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693'
                        //   productImageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 0.02 * screenWidth,
                      left: 0.02 * screenWidth,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // 'Lowson Chair'
                              productName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            // SizedBox(
                            //   width: 0.07 * screenWidth,
                            // ),
                            IconButton(
                              onPressed: () {
                              controller.deletecartProduct(id,context);
                              },
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                color: kPrefixIconColor,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     CircleAvatar(
                        //       radius: 0.01 * screenWidth,
                        //       backgroundColor: kBlueColor,
                        //     ),
                        //     // SizedBox(
                        //     //   width: 0.03 * screenWidth,
                        //     // ),
                        //     const Text(
                        //       'Blue Grey',
                        //       style: TextStyle(
                        //         color: kspecialGrey,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹ $productPrice',
                                  style: const TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 0.10 * screenWidth,
                            // ),
                            Container(
                              width: 0.3 * screenWidth,
                              height: 0.04 * screenHeight,
                              decoration: BoxDecoration(
                                color: kPrefixIconColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  Text(
                                    productQuantity.toString(),
                                    style: const TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 0.03 * screenHeight,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
