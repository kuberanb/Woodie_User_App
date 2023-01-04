import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Orders/tabs/active_orders_screen.dart';
import 'package:woodie/views/Orders/tabs/completed_orders_screen.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: const [
            TabBar(
                indicatorColor: kWhiteColor,
                indicatorWeight: 3,
                labelStyle: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                ActiveOrders(),
                CompletedOrders(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
