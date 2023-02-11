import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/my_cart_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/profile_screen.dart';
import 'package:woodie/views/homeAndActionMenu/home_screen.dart';

import '../views/Orders/my_orders_screen.dart';

class NavigationScreenController extends GetxController {
  var pageIndex = 0.obs;

  final pages = [
    const HomeScreen(),
    const MyCartScreen(),
    const MyOrders(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageIndex.close();
  }

  void changeIndex(int index) {
    pageIndex.value = index;
  }

  final bottomNavigationBarItemList = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Orders',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.man),
      label: 'Profile',
    ),
  ];
}
