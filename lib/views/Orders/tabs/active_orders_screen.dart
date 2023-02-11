import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/order_controller.dart';
import 'package:woodie/controllers/trackOrdersController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/order_model.dart';
import 'package:woodie/views/Orders/widgets/order_item_active.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orderController = Get.put(OrderController());
    final userEmail = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder(
        stream: orderController.getAllOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kWhiteColor,
                strokeWidth: 2,
              ),
            );
          } else {
            if (snapshot.hasData) {
              List<OrderModel> activeOrdersList = [];
              for (var activeOrder in snapshot.data!) {
                if (activeOrder.isCompleted != true &&
                    activeOrder.isCancelled != true &&
                    activeOrder.userEmail == userEmail) {
                  activeOrdersList.add(activeOrder);
                  log('${activeOrder.productName} in Active order List');
                }
              }
              // log('//////////////');
              //  for(var item in activeOrdersList){
              //  log(item.productName);
              //  }
              return (activeOrdersList.isEmpty)
                  ? const Center(
                      child: Text(
                        'No Active Orders',
                        style: TextStyle(color: kWhiteColor, fontSize: 20),
                      ),
                    )
                  : ListView.separated(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) => OrderItemActive(
                            orderItem: snapshot.data![index],
                          )),
                      separatorBuilder: ((context, index) => SizedBox(
                            height: 0.02 * screenHeight,
                          )),
                      itemCount: activeOrdersList.length,
                    );
            } else {
              return const Center(
                child: Text(
                  'Some Error Occured',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                  ),
                ),
              );
            }
          }
        },
      ),

      //  ListView.separated(
      //   // shrinkWrap: true,
      //   // physics: const NeverScrollableScrollPhysics(),
      //   itemBuilder: ((context, index) => const OrderItemActive()),
      //   separatorBuilder: ((context, index) => SizedBox(
      //         height: 0.02 * screenHeight,
      //       )),
      //   itemCount: 10,
      // ),
    );
  }
}
