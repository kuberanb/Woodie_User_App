import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/address_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/address_model.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/add_new_address_screen.dart';

import '../Cart_and_Order_and_checkout/address_full_screen.dart';

class ProfileAddressScreen extends StatelessWidget {
  ProfileAddressScreen({super.key});

  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(AddressController());
    // GlobalKey _scaffold = GlobalKey();

    return Scaffold(
      // key: _scaffold,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Shipping Addresss',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        itemBuilder: (context, index) => ProfileAddressListTile(
                          // radio: Radio(
                          //   activeColor: kWhiteColor,
                          //   value: index,
                          //   fillColor: MaterialStateColor.resolveWith(
                          //       (states) => kWhiteColor),
                          //   groupValue: groupValue,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       groupValue = newValue!;
                          //       log(groupValue.toString());
                          //     });
                          //   },
                          // ),
                          listTileTitle: snapshot.data![index].fullName,
                          listTileSubtitle: snapshot.data![index].hName +
                              snapshot.data![index].state,
                          pincode: snapshot.data![index].pincode,
                          addresList: snapshot.data!,
                          index: index,
                          //  globalKey: _scaffold,
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
          ],
        ),
      ),
    );
  }
}

class ProfileAddressListTile extends StatelessWidget {
  ProfileAddressListTile({
    super.key,
    required this.listTileTitle,
    required this.listTileSubtitle,
    required this.pincode,
    required this.addresList,
    required this.index,
    //  required this.globalKey,
  });

  final String listTileTitle;
  final String listTileSubtitle;
  final int pincode;
  List<AddressModel> addresList;
  int index;
  // final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => AddressFullScreen(
                  selectedAddress: addresList[index],
                )),
          ),
        );
      },
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
              onPressed: () async {
                await showAddressDeleteBottonSheet(
                    context: context,
                    screenHeight: screenHeight,
                    addressDeleteFunction: () async {
                      await FirebaseFirestore.instance
                          .collection(addressCollection)
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection(userAddressCollection)
                          .doc(listTileTitle + pincode.toString())
                          .delete();

                      Navigator.of(context).pop();

                      errorSnackBar('Address Deleted Sucessfully', context);
                    },
                    screenWidth: screenWidth);
              },
              icon: const Icon(
                Icons.delete,
                color: kWhiteColor,
              ),
            ),
            // radio,
          ],
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => AddressFullScreen(
                    selectedAddress: addresList[index],
                  )),
            ),
          );
        },
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
