import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Orders/order_full_screen.dart';

class OrderItemCompleted extends StatelessWidget {
  OrderItemCompleted({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.userAddress,
    required this.isCancelled,
    required this.isCompleted,
    required this.orderId,
    required this.userEmail,
    required this.paymentMethod,
  });

  String imageUrl;
  String productName;
  int productQuantity;
  int productPrice;
  String userAddress;
  bool isCancelled;
  bool isCompleted;
  String orderId;
  String userEmail;
  String paymentMethod;
  // VoidCallback completedOrderItemFullScreenFunction;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => OrderFullScreen(
                  address: userAddress,
                  imageUrl: imageUrl,
                  isCancelled: isCancelled,
                  isCompleted: isCompleted,
                  paymentMethod: paymentMethod,
                  orderId: orderId,
                  productName: productName,
                  productPrice: productPrice,
                  productQuantity: productQuantity,
                )),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 0.2 * screenHeight,
        decoration: BoxDecoration(
          color: kListTileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.01 * screenWidth,
            left: 0.01 * screenWidth,
            bottom: 0.02 * screenHeight,
            top: 0.02 * screenHeight,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 0.02 * screenWidth,
                  left: 0.02 * screenWidth,
                ),
                child: Container(
                  height: 0.13 * screenHeight,
                  width: 0.2 * screenWidth,
                  decoration: BoxDecoration(
                    color: kListTileColor,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        // 'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693'
                        imageUrl,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 0.02 * screenWidth,
                    left: 0.02 * screenWidth,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              //'Lowson Chair'
                              productName,
                              style: const TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Qty: $productQuantity',
                            style: const TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '₹ $productPrice',
                            style: const TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Payment Method :',
                            style: TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            paymentMethod,
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order Status :',
                            style: TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            (isCompleted == true)
                                ? 'Order Completed '
                                : (isCancelled == true)
                                    ? 'Order Cancelled'
                                    : 'Delivery in Progress',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
