import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/trackOrdersController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Orders/widgets/order_item_active.dart';
import 'package:woodie/views/Orders/widgets/order_item_completed.dart';

class TrackOrders extends StatelessWidget {
  const TrackOrders({super.key});

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
            left: 0.02 * screenWidth,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const OrderItemCompleted(),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Order Status Details',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              AnotherStepper(
                activeBarColor: kWhiteColor,

                stepperList: controller.orderStatusData,
                stepperDirection: Axis.vertical,
                activeIndex: 2,
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
