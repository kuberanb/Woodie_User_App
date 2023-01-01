import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
      body: ListView.separated(
        itemBuilder: ((context, index) => const MyCartSingleItem()),
        separatorBuilder: ((context, index) => SizedBox(
              height: 0.02 * screenHeight,
            )), 
        itemCount: 25, 
      ),
    );
  }
}

class MyCartSingleItem extends StatelessWidget {
  const MyCartSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          right: 0.025 * screenWidth,
          left: 0.025 * screenWidth, 
        ),
        child: Container(
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          height: 0.16 * screenHeight,
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.02 * screenHeight,
              left: 0.02 * screenHeight,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 0.15 * screenHeight,
                          width: 0.3 * screenWidth,
                          child: Image.network(
                            'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Lowson Chair',
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(
                              width: 0.1 * screenWidth,
                            ),
                            IconButton(
                              onPressed: () {},
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  '   ₹5000',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0.10 * screenWidth,
                            ),
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
                                  const Text(
                                    '2',
                                    style: TextStyle(
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
