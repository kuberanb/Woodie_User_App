import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Orders/track_orders_screen.dart';

class OrderItemActive extends StatelessWidget {
  const OrderItemActive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 0.19 * screenHeight,
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
                  borderRadius: BorderRadius.circular(10),
                  color: kspecialGrey,
                ),
                child: Image.network(
                  'https://ii1.pepperfry.com/media/catalog/product/a/v/800x880/avilys-solid-wood-coffee-table-in-provincial-teak-finish-by-woodsworth-avilys-solid-wood-coffee-tabl-wqosro.jpg',
                  fit: BoxFit.contain,
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
                      children: const [
                        Text(
                          'Lowson Chair',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Qty: 1',
                          style: TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 0.01 * screenHeight,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '₹ 6000',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kspecialGrey,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const TrackOrders()),
                                ),
                              );
                            },
                            child: const Text(
                              'Track Order',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 18,
                              ),
                            ),
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
    );
  }
}
