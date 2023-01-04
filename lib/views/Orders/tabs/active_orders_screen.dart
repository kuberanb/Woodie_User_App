import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Orders/widgets/order_item_active.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.02 * screenWidth,
              left: 0.02 * screenWidth,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) => const OrderItemActive()),
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 0.02 * screenHeight,
                        )),
                    itemCount: 10),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
