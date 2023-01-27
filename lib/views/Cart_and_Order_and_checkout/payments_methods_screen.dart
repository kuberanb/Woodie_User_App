import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/address_model.dart';
import 'package:woodie/models/cart_model.dart';

class PaymentsMethodsScreen extends StatefulWidget {
  const PaymentsMethodsScreen(
      {super.key, required this.address, required this.cartProductsList});

  final AddressModel address;
  final List<CartModel> cartProductsList;

  @override
  State<PaymentsMethodsScreen> createState() => _PaymentsMethodsScreenState();
}

class _PaymentsMethodsScreenState extends State<PaymentsMethodsScreen> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        title: const Text(
          'Payments Methods',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.03 * screenWidth,
            left: 0.03 * screenWidth,
          ),
          child: SizedBox(
            height: 0.9 * screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select the Payment Method you want to use.',
                    style: TextStyle(
                      color: kPrefixIconColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  tileColor: kListTileColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: const Text(
                    '  R',
                    style: TextStyle(
                      color: kBlueColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: const Text(
                    'RazorPay',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Radio(
                      value: 0,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kWhiteColor),
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  tileColor: kListTileColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.circular(40),
                            color: kWhiteColor,
                            border: Border.all(
                              color: kBlackColor,
                              width: 0.015 * screenWidth,
                            ),
                          ),
                          // height: 0.15 * screenWidth,
                          // width: 0.15 * screenWidth,
                          // color: kListTileColor,

                          child: Image.asset(
                            'assets/images/google_icon.png',
                            fit: BoxFit.fill,
                            width: 0.08 * screenWidth,
                            height: 0.08 * screenWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: const Text(
                    'Cash On Delivery',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kWhiteColor),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    log(widget.address.city.toString());
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: screenWidth,
                      height: 0.06 * screenHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Continue Payment',
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
