import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodie/core/colorPalettes.dart';

import '../BottomNavigationbar/navigation_screen.dart';

class OrderSucessScreen extends StatelessWidget {
  const OrderSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.2 * screenHeight,
                ),
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: 0.55 * screenWidth,
                  color: kWhiteColor,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Text(
                  'Order Successful!',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 25 * textScaleFactor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                Text(
                  'You have successfully placed order',
                  style: TextStyle(
                    color: kLightWhiteColor,
                    fontSize: 18 * textScaleFactor,
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                //  ElevatedButton(onPressed: (){}, child: Text('Ok',style: TextStyle(color: kWhiteColor,fontSize: 20*textScaleFactor),),),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: ((context) => const NavigationScreen()),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  splashColor: kWhiteColor,
                  overlayColor: MaterialStateProperty.all(
                    kWhiteColor,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kLightWhiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.01 * screenHeight,
                          horizontal: 0.2 * screenWidth),
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
