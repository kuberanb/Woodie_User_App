import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import "package:get/get.dart";
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/cart_model.dart';

import '../../controllers/selected_product_fulllscreen_controller.dart';

class SelectedProductFullScreen extends StatefulWidget {
  String productName;
  int productPrice;
  String productDescription;
  List<dynamic> productImageList;
  SelectedProductFullScreen({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImageList,
  });

  @override
  State<SelectedProductFullScreen> createState() =>
      _SelectedProductFullScreenState();
}

class _SelectedProductFullScreenState extends State<SelectedProductFullScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final controller = Get.put(SelectedProductFullScreenController());
    controller.productTotalPrice(widget.productPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(SelectedProductFullScreenController());
    // int productQuantity = 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        controller.totalPrice = 0;
        controller.productQuantity = 1;
        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text(
            // 'Double Bed',
            widget.productName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.totalPrice = 0;
              controller.productQuantity = 1;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kWhiteColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.03 * screenWidth,
              left: 0.03 * screenWidth,
              top: 0.01 * screenHeight,
              // bottom: 0.01 * screenHeight,
            ),
            child: Column(
              children: [
                ProductFullScreenImages(
                  imageUrlList: widget.productImageList,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.03 * screenHeight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          // 'Century Double Bed',
                          widget.productName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kWhiteColor,
                            fontSize: 22,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.favorite_outline_outlined,
                        //     color: kWhiteColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: const [
                //     Icon(
                //       Icons.star_rounded,
                //       color: kLightGreyColor,
                //     ),
                //     Text(
                //       '4.8 (6,578 review)',
                //       style: TextStyle(color: kLightWhiteColor),
                //     )
                //   ],
                // ),
                const Divider(
                  thickness: 1,
                  color: kLightGreyColor,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(color: kWhiteColor, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                Text(
                  //                 '''Lorem ipsum dolor sit amet.consectur adipiscing elit, sed
                  // do eiusmod tempor inciddunt ut labore at bkk from
                  // hbjdjno ldm asjkhas nlnsal jnlnsal jlnoiw anoianoa
                  // andoiawa jkhksajnsa ,nndlan kbdskjbs jnlnasodn kbjk   mn jk l'''

                  widget.productDescription,
                  style: const TextStyle(
                    color: kExtraLightWhiteColor,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 0.05 * screenWidth,
                    ),
                    GetBuilder<SelectedProductFullScreenController>(
                      init: controller,
                      builder: (_) {
                        return Container(
                          width: 0.3 * screenWidth,
                          height: 0.05 * screenHeight,
                          decoration: BoxDecoration(
                            color: kListTileColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await controller
                                      .decreaseProductQuantity(context);
                                  await controller
                                      .productTotalPrice(widget.productPrice);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: kWhiteColor,
                                ),
                              ),
                              Text(
                                // '0'
                                controller.productQuantity.toString(),
                                style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await controller.increaseProductQuantity(
                                    context,
                                  );
                                  await controller
                                      .productTotalPrice(widget.productPrice);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Divider(
                  color: kLightGreyColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<SelectedProductFullScreenController>(
                      init: controller,
                      builder: (_) {
                        return Column(
                          children: [
                            const Text(
                              'Total Price',
                              style: TextStyle(
                                fontSize: 14,
                                color: kExtraLightWhiteColor,
                              ),
                            ),
                            SizedBox(
                              height: 0.005 * screenHeight,
                            ),
                            Text(
                              // '₹ 25,000',
                              //widget.productPrice.toString()
                              '₹  ${controller.totalPrice.toString()}',

                              style: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        final cart = FirebaseFirestore.instance
                            .collection(cartCollection)
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .collection(userCartCollection)
                            .doc(widget.productName +
                                2.toString());
                        await cart.set(CartModel(
                          id: cart.id,
                          productName: widget.productName,
                          productImage: widget.productImageList[0],
                          productPrice: controller.totalPrice,
                          productQuantity: controller.productQuantity,
                        ).toJson());

                        errorSnackBar(
                            'Product Added to cart Sucessfully', context);
                      },
                      child: Container(
                        width: 0.6 * screenWidth,
                        height: 0.05 * screenHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kWhiteColor),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: kBlackColor,
                              ),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductFullScreenImages extends StatelessWidget {
  List<dynamic> imageUrlList;
  ProductFullScreenImages({super.key, required this.imageUrlList});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 0.42 * screenHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => ProductFullScreenSingleImage(
              imageUrl: imageUrlList[index],
            )),
        itemCount: imageUrlList.length,
      ),
    );
  }
}

class ProductFullScreenSingleImage extends StatelessWidget {
  String imageUrl;
  ProductFullScreenSingleImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        right: 0.01 * screenWidth,
        left: 0.01 * screenWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 0.9 * screenWidth,
            height: 0.4 * screenHeight,
            decoration: BoxDecoration(
              color: kListTileColor,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  // 'https://www.ulcdn.net/images/products/149916/slide/666x363/0.jpg?1548906914'
                  imageUrl,
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // const Text(
          //   'Form Cushioned Sofa',
          //   style: TextStyle(
          //       color: kWhiteColor,
          //       fontSize: 18,
          //       overflow: TextOverflow.ellipsis),
          // ),
          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: 0.05 * screenWidth,
          //     ),
          //     const Text(
          //       '₹ 25,000',
          //       style: TextStyle(
          //         color: kLightWhiteColor,
          //         fontSize: 16,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
