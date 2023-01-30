import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/searchScreenController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/product_model.dart';
import 'package:woodie/views/homeAndActionMenu/home_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_product_fullscreen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, required this.productList});

  List<ProductModel> productList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel>? searchedProductList;

  @override
  void initState() {
    searchedProductList = widget.productList;
    // List.from(widget.productList).cast<ProductModel>().toList();
    // TODO: implement initState
    // final controller = Get.put(SearchScreenController());

    super.initState();
  }

  searchAllProducts(String text) {
    setState(() {
      searchedProductList = widget.productList
          .where((product) =>
              product.productName!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(SearchScreenController());
    // final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.searchController.clear();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        title: const Text(
          'Search Screen',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 0.03 * screenHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.searchController,
                  onChanged: ((value) {
                    //  controller.searchController.text = value;
                    // controller.searchProductsFromFirebase();
                    searchAllProducts(value);
                  }),
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kPrefixIconColor,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.searchController.clear();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                        color: kPrefixIconColor,
                      ),
                    ),
                    hintStyle: const TextStyle(color: kPrefixIconColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 0.05 * screenWidth,
                  left: 0.05 * screenWidth,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '''Results for "${controller.searchController.text}"''',
                      style: const TextStyle(
                        color: kPrefixIconColor,
                        fontSize: 16,
                      ),
                    ),
                    // Text(
                    //   '${controller.foundProductLength} founds',
                    //   style: const TextStyle(
                    //     color: kPrefixIconColor,
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),

              (searchedProductList!.isEmpty)
                  ? const Center(
                      child: Text(
                        'Searched Item Not Found',
                        style: TextStyle(color: kWhiteColor, fontSize: 20),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.02 * screenHeight,
                      ),
                      itemCount: searchedProductList!.length,
                      itemBuilder: ((context, index) => ProductListTile(
                          fullScreenNavigation: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) =>
                                    SelectedProductFullScreen(
                                      productName: searchedProductList![index]
                                          .productName!,
                                      productPrice: searchedProductList![index]
                                          .productPrice!,
                                      productDescription:
                                          searchedProductList![index]
                                              .productDescription!,
                                      productImageList:
                                          searchedProductList![index]
                                              .productImages!,
                                    )),
                              ),
                            );
                          },
                          productName: searchedProductList![index].productName!,
                          productPrice:
                              searchedProductList![index].productPrice!,
                          imageUrl:
                              searchedProductList![index].productImages![0] ??
                                  '')),
                    ),

              // StreamBuilder<QuerySnapshot>(
              //   stream: controller.searchProductsFromFirebase(),
              //   builder: ((context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: kWhiteColor,
              //         ),
              //       );
              //     } else if (snapshot.hasData) {
              //       return GridView.builder(
              //         physics:
              //             const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              //         shrinkWrap: true, // You won't see infinite size error
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           mainAxisSpacing: 0.02 * screenHeight,
              //         ),
              //         itemBuilder: ((context, index) => ProductListTile(
              //               fullScreenNavigation: () {
              //                 Navigator.of(context).push(
              //                   MaterialPageRoute(
              //                     builder: ((context) =>
              //                         SelectedProductFullScreen(
              //                           productName: snapshot.data?.docs[index]
              //                               ['productName'],
              //                           productPrice: snapshot.data?.docs[index]
              //                               ['productPrice'],
              //                           productDescription: snapshot.data
              //                               ?.docs[index]['productDescription'],
              //                           productImageList: snapshot
              //                               .data?.docs[index]['productImages'],
              //                         )),
              //                   ),
              //                 );
              //               },
              //               productName: snapshot.data?.docs[index]
              //                   ['productName'],
              //               productPrice: snapshot.data?.docs[index]
              //                   ['productPrice'],
              //               imageUrl: snapshot.data?.docs[index]
              //                   ['productImages'][0],
              //             )),
              //         itemCount: (snapshot.data?.docs.length),
              //       );
              //     } else {
              //       return const Center(
              //         child: Text(
              //           'Something Went Wrong',
              //           style: TextStyle(
              //             color: kWhiteColor,
              //             fontSize: 22,
              //           ),
              //         ),
              //       );
              //     }
              //   }),
              // ),

              // GridView.builder(
              //   physics:
              //       const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              //   shrinkWrap: true, // You won't see infinite size error
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 0.02 * screenHeight,
              //   ),
              //   itemBuilder: ((context, index) => ProductListTile(
              //         fullScreenNavigation: () {},
              //         imageUrl: '',
              //         productName: '',
              //         productPrice: null,
              //       )),
              //   itemCount: 10,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
