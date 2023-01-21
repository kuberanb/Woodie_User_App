import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/add_new_address_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippinAddressState();
}

class _ShippinAddressState extends State<ShippingAddressScreen> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: kListTileColor,
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: const Text(
                    '17/56 Kochi kerala',
                    style: TextStyle(color: kPrefixIconColor, fontSize: 16),
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
                        Radio(
                            activeColor: kWhiteColor,
                            value: 0,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => kWhiteColor),
                            groupValue: _value,
                            onChanged: (value) {
                              // if (_value == 1) {
                              setState(() {
                                _value = value!;
                              });
                            }),
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
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tileColor: kListTileColor,
                  title: const Text(
                    'Office',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: const Text(
                    '17/56 Kaakanad kerala',
                    style: TextStyle(color: kPrefixIconColor, fontSize: 16),
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
                        Radio(
                          activeColor: kWhiteColor,
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => kWhiteColor),
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                        ),
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
                ),
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
                      onTap: () {},
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
}
