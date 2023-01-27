import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/address_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/models/address_model.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/add_new_address_screen.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/payments_methods_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(AddressController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.02 * screenWidth,
            left: 0.02 * screenWidth,
          ),
          child: SizedBox(
            height: 0.9 * screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                // ListTile(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   tileColor: kListTileColor,
                //   title: const Text(
                //     'Home',
                //     style: TextStyle(
                //       color: kWhiteColor,
                //       fontSize: 18,
                //     ),
                //   ),
                //   subtitle: const Text(
                //     '17/56 Kochi kerala',
                //     style: TextStyle(color: kPrefixIconColor, fontSize: 16),
                //   ),
                //   trailing: SizedBox(
                //     height: 0.05 * screenHeight,
                //     width: 0.3 * screenWidth,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         IconButton(
                //           onPressed: () {},
                //           icon: const Icon(
                //             Icons.edit,
                //             color: kWhiteColor,
                //           ),
                //         ),
                //         Radio(
                //             activeColor: kWhiteColor,
                //             value: 0,
                //             fillColor: MaterialStateColor.resolveWith(
                //                 (states) => kWhiteColor),
                //             groupValue: _value,
                //             onChanged: (value) {
                //               // if (_value == 1) {
                //               setState(() {
                //                 _value = value!;
                //               });
                //             }),
                //       ],
                //     ),
                //   ),
                //   leading: InkWell(
                //     onTap: () {},
                //     child: Column(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             //borderRadius: BorderRadius.circular(40),
                //             color: kWhiteColor,
                //             border: Border.all(
                //               color: kLightGreyColor,
                //               width: 0.03 * screenWidth,
                //             ),
                //           ),
                //           // height: 0.15 * screenWidth,
                //           // width: 0.15 * screenWidth,
                //           // color: kListTileColor,

                //           child: Image.asset(
                //             'assets/images/location_icon.png',
                //             fit: BoxFit.fill,
                //             width: 0.08 * screenWidth,
                //             height: 0.08 * screenWidth,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                StreamBuilder(
                    stream: controller.getAllAddress(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kWhiteColor,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          ////////////////////

                          //= snapshot.data![0].fullName;
                          ///////////////////
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ShippingAddressListTile(
                              radio: Radio(
                                activeColor: kWhiteColor,
                                value: index,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => kWhiteColor),
                                groupValue: groupValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    groupValue = newValue!;
                                    log(groupValue.toString());
                                  });
                                },
                              ),
                              listTileTitle: snapshot.data![index].fullName,
                              listTileSubtitle: snapshot.data![index].hName +
                                  snapshot.data![index].state,
                            ),
                            separatorBuilder: ((context, index) => SizedBox(
                                  height: 0.02 * screenHeight,
                                )),
                            itemCount: snapshot.data!.length,
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'No Saved Address Present',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text(
                            'Something Went Wrong',
                            style: TextStyle(color: kWhiteColor, fontSize: 20),
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const AddNewAddressScreen()),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth,
                    height: 0.06 * screenHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kLightGreyColor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add New Address',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                // const Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        gotoPaymentScreen();
                      },
                      child: Container(
                        width: screenWidth,
                        height: 0.06 * screenHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kWhiteColor),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Apply',
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gotoPaymentScreen() async {
    final controller = Get.put(AddressController());

    List<AddressModel> addressList = await controller.getAllAddress().first;
    AddressModel address = addressList[groupValue];
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return PaymentsMethodsScreen(address: address);
      },
    ));
  }
}

// ignore: must_be_immutable
class ShippingAddressListTile extends StatelessWidget {
  ShippingAddressListTile({
    Key? key,
    required this.listTileTitle,
    required this.listTileSubtitle,
    required this.radio,
  }) : super(key: key);

  final String listTileTitle;
  final String listTileSubtitle;
  final Widget radio;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: kListTileColor,
      title: Text(
        listTileTitle,
        style: const TextStyle(
          color: kWhiteColor,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        listTileSubtitle,
        style: const TextStyle(
          color: kPrefixIconColor,
          fontSize: 16,
        ),
      ),
      trailing: SizedBox(
        height: 0.05 * screenHeight,
        width: 0.3 * screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: kWhiteColor,
              ),
            ),
            radio,
          ],
        ),
      ),
      leading: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(40),
                color: kWhiteColor,
                border: Border.all(
                  color: kLightGreyColor,
                  width: 0.03 * screenWidth,
                ),
              ),
              // height: 0.15 * screenWidth,
              // width: 0.15 * screenWidth,
              // color: kListTileColor,

              child: Image.asset(
                'assets/images/location_icon.png',
                fit: BoxFit.fill,
                width: 0.08 * screenWidth,
                height: 0.08 * screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
