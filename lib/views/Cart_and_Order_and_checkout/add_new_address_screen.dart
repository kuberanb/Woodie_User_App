import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/address_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/models/address_model.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  static final formKey = GlobalKey<FormState>();

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(AddressController());

    return WillPopScope(
      onWillPop: (() async {
        controller.fullNameController.clear();
        controller.pincodeController.clear();
        controller.stateController.clear();
        controller.cityController.clear();
        controller.buildingNameController.clear();
        controller.roadNameController.clear();
        return true;
      }),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'Add New Address',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              controller.fullNameController.clear();
              controller.pincodeController.clear();
              controller.stateController.clear();
              controller.cityController.clear();
              controller.buildingNameController.clear();
              controller.roadNameController.clear();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kWhiteColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.02 * screenWidth,
              left: 0.02 * screenWidth,
            ),
            child: Form(
              key: AddNewAddressScreen.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.fullNameController,
                      style: const TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.text_fields_rounded,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name can't be empty";
                        } else if (value.length <= 1) {
                          return 'Name Length should greater than 1 letters';
                        } else if (value.contains(RegExp(r'[0-9]'))) {
                          return "Name can't include numbers";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.pincodeController,
                      style: const TextStyle(color: kWhiteColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'Pincode',
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Pincode can't be empty";
                        } else if (value.length <= 5) {
                          return 'Pincode length should be atleast 6 letters ';
                        } else if (!value.contains(RegExp(r'[0-9]'))) {
                          return "Pincode can't include alphabets";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.stateController,
                      style: const TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'State',
                        prefixIcon: const Icon(
                          Icons.place,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "State name can't be empty";
                        } else if (value.length <= 2) {
                          return 'State name Length should greater than 2 letters';
                        } else if (value.contains(RegExp(r'[0-9]'))) {
                          return "State name can't include numbers";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.cityController,
                      style: const TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'City',
                        prefixIcon: const Icon(
                          Icons.place,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "City name can't be empty";
                        } else if (value.length <= 2) {
                          return 'City name Length should greater than 2 letters';
                        } else if (value.contains(RegExp(r'[0-9]'))) {
                          return "City name can't include numbers";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.buildingNameController,
                      style: const TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'House Name/Number',
                        prefixIcon: const Icon(
                          Icons.place,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "House name/number can't be empty";
                        } else if (value.length <= 2) {
                          return 'House name/number Length should greater than 2 letters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.roadNameController,
                      style: const TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        fillColor: kListTileColor,
                        filled: true,
                        hintText: 'Road name, Area, Colony',
                        prefixIcon: const Icon(
                          Icons.place,
                          color: kPrefixIconColor,
                        ),
                        hintStyle: const TextStyle(color: kPrefixIconColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: kBlackColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Road name/number can't be empty";
                        } else if (value.length <= 2) {
                          return 'Road name/number Length should greater than 2 letters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (AddNewAddressScreen.formKey.currentState!
                          .validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: ((context) => const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: kWhiteColor,
                                ),
                              )),
                        );
                        try {
                          final address = FirebaseFirestore.instance
                              .collection(addressCollection)
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection(userAddressCollection)
                              .doc(controller.fullNameController.text +
                                  controller.pincodeController.text);
                          await address.set(AddressModel(
                                  id: address.id,
                                  fullName: controller.fullNameController.text,
                                  pincode: int.parse(
                                      controller.pincodeController.text),
                                  state: controller.stateController.text,
                                  city: controller.cityController.text,
                                  hName: controller.buildingNameController.text,
                                  rName: controller.roadNameController.text)
                              .toJson());

                          errorSnackBar('Address Added Sucessfully', context);

                          controller.fullNameController.clear();
                          controller.pincodeController.clear();
                          controller.stateController.clear();
                          controller.cityController.clear();
                          controller.buildingNameController.clear();
                          controller.roadNameController.clear();
                        } catch (e) {
                          errorSnackBar(e.toString(), context); 
                        }

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0.01 * screenHeight,
                        bottom: 0.01 * screenHeight,
                        right: 0.02 * screenWidth,
                        left: 0.02 * screenWidth,
                      ),
                      child: Container(
                        height: 0.06 * screenHeight,
                        // width: 0.07*screenWidth,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kLightGreyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Submit',
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
