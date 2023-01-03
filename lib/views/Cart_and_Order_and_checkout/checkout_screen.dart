import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Checkout',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.05 * screenWidth,
            left: 0.05 * screenWidth,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Shipping Address',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ListTile(
                tileColor: kListTileColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                onTap: () {},
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 18,
                  ),
                ),
                leading: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(40),
                          color: kWhiteColor,
                          border: Border.all(
                            color: kLightGreyColor,
                            width: 0.03 * screenWidth,
                          ),
                        ),
                        // height: 0.15 * screenWidth,
                        // width: 0.15 * screenWidth,
                        // color: kListTileColor,

                        child: Image.asset(
                          'assets/images/location_icon.png',
                          fit: BoxFit.fill,
                          width: 0.08 * screenWidth,
                          height: 0.08 * screenWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text(
                  '17/123 Kaakanad kochi',
                  style: TextStyle(
                    color: kLightWhiteColor,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: kWhiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kspecialGrey,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Order List',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) =>
                    const CheckOutScreenSingleItem()),
                separatorBuilder: ((context, index) => SizedBox(
                      height: 0.02 * screenHeight,
                    )),
                itemCount: 6,
              ),

              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kspecialGrey,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Choose Shipping',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 0.02 * screenHeight,
              // ),
              // ListTile(
              //   onTap: () {},
              //   shape: const RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(20),
              //     ),
              //   ),
              //   tileColor: kListTileColor,
              //   title: const Text(
              //     'Choose Shipping Address',
              //     style: TextStyle(
              //       color: kWhiteColor,
              //       fontSize: 18,
              //     ),
              //   ),
              //   trailing: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.arrow_right_alt_rounded,
              //       color: kWhiteColor,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),

              Container(
                width: double.infinity,
                height: 0.17 * screenHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    0.05 * screenWidth,
                  ),
                  color: kListTileColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    0.01 * screenHeight,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Amount',
                            style: TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹50000',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Shipping',
                            style: TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹50',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * screenHeight,
                      ),
                      const Divider(
                        thickness: 1,
                        color: kPrefixIconColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹50050',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: screenWidth,
                  height: 0.05 * screenHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Continue to Payment',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: kBlackColor,
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),

              //  CheckOutScreenSingleItem()
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOutScreenSingleItem extends StatelessWidget {
  const CheckOutScreenSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: ListTile(
        tileColor: kListTileColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        leading: SizedBox(
          height: 0.07 * screenHeight,
          width: 0.3 * screenWidth,
          child: Image.network(
              'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693'),
        ),
        title: const Text(
          'Mini Wooden Table',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 18,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '₹ 5000',
              style: TextStyle(
                color: kLightWhiteColor,
                fontSize: 14,
              ),
            ),
            Container(
              height: 0.05 * screenWidth,
              width: 0.05 * screenWidth,
              decoration: BoxDecoration(
                color: kspecialGrey,
                borderRadius: BorderRadius.circular(
                  0.1 * screenWidth,
                ),
              ),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
