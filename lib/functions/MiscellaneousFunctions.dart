import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/main.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/My_cart.dart';

showCartToCheckoutBottomSheet(
    {required BuildContext context,
    required screenHeight,
    required screenWidth}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              0.02 * screenWidth,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'Total price',
                      style: TextStyle(
                        color: kLightWhiteColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '₹ 1000',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 0.6 * screenWidth,
                    height: 0.05 * screenHeight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kWhiteColor),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Checkout',
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
              ],
            ),
          ),
        )),
  );
}

showRemoveFromCartBottomSheet(
    {required BuildContext context,
    required screenHeight,
    required screenWidth}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) => Padding(
          padding: EdgeInsets.all(
            0.02 * screenWidth,
          ),
          child: Container(
            height: 0.35 * screenHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      thickness: 1,
                      color: kspecialGrey,
                      indent: 0.4 * screenWidth,
                      endIndent: 0.4 * screenWidth,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Remove from Cart?',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Divider(
                  color: kspecialGrey,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const MyCartSingleItem(),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Divider(
                  color: kspecialGrey,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.05 * screenHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kLightWhiteColor),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Cancel',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.05 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Yes,Remove',
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
                SizedBox(
                  height: 0.04 * screenHeight,
                ),
              ],
            ),
          ),
        )),
  );
}

showLogoutBottonSheet(
    {required BuildContext context,
    required screenHeight,
    required VoidCallback logOutFunction,
    required screenWidth}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) => Container(
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.1 * screenHeight),
              topRight: Radius.circular(
                0.1 * screenWidth,
              ),
            ),
          ),
          width: screenWidth,
          height: 0.25 * screenHeight,
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.05 * screenWidth,
              left: 0.05 * screenWidth,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 0.15 * screenWidth,
                      height: 0.01 * screenHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kspecialGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Divider(
                  color: kspecialGrey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.06 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kspecialGrey,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Cancel',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: logOutFunction,
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.06 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Yes,LogOut',
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
        )),
  );
}

errorSnackBar(String? text, BuildContext context) {
  if (text == null) return;

  final snackBar = SnackBar(
   // backgroundColor: kListTileColor,
   backgroundColor: kRedColor,
   margin: const EdgeInsets.all(20),
  behavior: SnackBarBehavior.floating,

    duration: const Duration(
      seconds: 2,
    ),
    content: Text(
      text,
      style: const TextStyle(
        color: kWhiteColor,
        fontSize: 18,
      ),
    ),
  );

  //  messengerKey.currentState!
  //   ..removeCurrentSnackBar()
  //   ..showSnackBar(snackBar);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
