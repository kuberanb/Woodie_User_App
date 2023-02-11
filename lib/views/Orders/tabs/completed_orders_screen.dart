import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/order_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/order_model.dart';
import 'package:woodie/views/Orders/order_full_screen.dart';
import 'package:woodie/views/Orders/widgets/order_item_completed.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orderController = Get.put(OrderController());
    final email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.02 * screenWidth,
              left: 0.02 * screenWidth,
            ),
            child: StreamBuilder(
              stream: orderController.getAllOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kWhiteColor,
                    ),
                  );
                } else if (snapshot.hasData) {
                  List<OrderModel> completedOrdersList = [];
                  for (var orderItem in snapshot.data!) {
                    if (orderItem.isCompleted == true ||
                        orderItem.isCancelled == true &&
                            orderItem.userEmail == email) {
                      completedOrdersList.add(orderItem);
                      log('${orderItem.productName} in Completed Orders List');
                    }
                  }
                  return (completedOrdersList.isEmpty)
                      ? const Center(
                          child: Text('No Completed Orders Present'),
                        )
                      : SizedBox(
                          height: screenHeight,
                          width: screenWidth,
                          child: ListView.separated(
                            itemCount: completedOrdersList.length,
                            itemBuilder: ((context, index) =>
                                OrderItemCompleted(
                                  imageUrl: completedOrdersList[index].imageUrl,
                                  productName:
                                      completedOrdersList[index].productName,
                                  productQuantity:
                                      completedOrdersList[index].cartCount,
                                  productPrice:
                                      completedOrdersList[index].price,
                                  userAddress:
                                      completedOrdersList[index].address,
                                  isCancelled:
                                      completedOrdersList[index].isCancelled,
                                  isCompleted:
                                      completedOrdersList[index].isCompleted,
                                  orderId: completedOrdersList[index].orderId,
                                  userEmail:
                                      completedOrdersList[index].userEmail,
                                  paymentMethod:
                                      completedOrdersList[index].payment,
                                  // completedOrderItemFullScreenFunction: () {
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //       builder: ((context) =>
                                  //           OrderFullScreen()),
                                  //     ),
                                  //   );
                                  // },
                                )),
                            separatorBuilder: ((context, index) => SizedBox(
                                  height: 0.03 * screenHeight,
                                )),
                          ),
                        );
                } else {
                  return const Center(
                    child: Text(
                      'Some Error Occured',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),

            //  Column(
            //   children: [
            //     SizedBox(
            //       height: 0.02 * screenHeight,
            //     ),
            //     ListView.separated(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemBuilder: ((context, index) =>
            //             const OrderItemCompleted()),
            //         separatorBuilder: ((context, index) => SizedBox(
            //               height: 0.02 * screenHeight,
            //             )),
            //         itemCount: 10),
            //     SizedBox(
            //       height: 0.02 * screenHeight,
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
