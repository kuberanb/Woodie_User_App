
import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/AccountSetup/account_setup_Screen.dart';
import 'package:woodie/views/BottomNavigationbar/navigation_screen.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/My_cart.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/add_new_address_screen.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/checkout_screen.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/payments_methods_screen.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/shipping_address_screen.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/LetYouIn_screen.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/createyourAccount.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/loginyourAccount.dart';
import 'package:woodie/views/OnboardingPages/WelcomePage.dart';
import 'package:woodie/views/Orders/my_orders_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/edit_profile_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/profile_screen.dart';
import 'package:woodie/views/forgot_reset_password/forgot_password_screen.dart';
import 'package:woodie/views/homeAndActionMenu/favourite_list.dart';
import 'package:woodie/views/homeAndActionMenu/home_screen.dart';
import 'package:woodie/views/homeAndActionMenu/search_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_category_screen.dart';
import 'package:woodie/views/homeAndActionMenu/selected_product_fullscreen.dart';
import 'package:woodie/views/homeAndActionMenu/special_offers_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    gotoScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.jpeg',
                  width: 60,
                  height: 140,
                ),
                SizedBox(
                  height: 0.2 * screenWidth,
                ),
                const Text(
                  'Woodie',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.03 * screenHeight,
          ),
          const CircularProgressIndicator(
            color: kWhiteColor,
            strokeWidth: 3,
          ),
        ],
      ),
    );
  }

  Future<void> gotoScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const NavigationScreen()),
      ),
    );
  }
}
