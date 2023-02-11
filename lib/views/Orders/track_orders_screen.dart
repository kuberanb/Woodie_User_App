import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/trackOrdersController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/order_model.dart';
import 'package:woodie/views/Orders/widgets/order_item_active.dart';
import 'package:woodie/views/Orders/widgets/order_item_completed.dart';

class TrackOrders extends StatelessWidget {
  const TrackOrders({super.key, required this.orderItem});

  final OrderModel orderItem;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(TrackOrderController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Track Orders',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.02 * screenWidth,
            left: 0.05 * screenWidth,
          ),
          child: Column(
            children: [
              AnotherStepper(
                activeBarColor: kWhiteColor,

                stepperList: controller.orderStatusData,
                stepperDirection: Axis.vertical,
                activeIndex: (orderItem.deliveryProcessStage == 0)
                    ? orderItem.deliveryProcessStage
                    : orderItem.deliveryProcessStage - 1,
                gap: 50,
                // iconWidth:
                //     40,
                // iconHeight:
                //     40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
