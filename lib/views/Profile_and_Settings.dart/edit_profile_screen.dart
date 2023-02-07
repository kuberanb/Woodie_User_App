import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/edit_profile_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: EditProfile._formKey,
          child: Column(
            children: [
              SizedBox(
                height: 0.015 * screenHeight,
              ),

              TextFormField(
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
                    return 'Enter Name';
                  } else if (value.length <= 1) {
                    return 'Name Length should greater than 1 letters';
                  } else if (value.contains(RegExp(r'[0-9]'))) {
                    return "Name can't include numbers";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 0.015 * screenHeight,
              ),
              TextFormField(
                controller: controller.emailController,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
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
                    return 'Enter Email Address';
                  } else if (EmailValidator.validate(value)) {
                    return null;
                  } else {
                    return 'Enter A Valid Email Address';
                  }
                },
              ),
              // SizedBox(
              //   height: 0.015 * screenHeight,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     //  controller: controller.dateOfBirthController,
              //     style: const TextStyle(color: kWhiteColor),
              //     decoration: InputDecoration(
              //       suffixIcon: IconButton(
              //         onPressed: () {},
              //         icon: const Icon(
              //           Icons.date_range_outlined,
              //           color: kPrefixIconColor,
              //         ),
              //       ),
              //       fillColor: kListTileColor,
              //       filled: true,
              //       hintText: 'Date of Birth',
              //       prefixIcon: const Icon(
              //         Icons.text_fields_outlined,
              //         color: kPrefixIconColor,
              //       ),
              //       hintStyle: const TextStyle(color: kPrefixIconColor),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //         borderSide: const BorderSide(
              //           color: kBlackColor,
              //           width: 2.0,
              //         ),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //         borderSide: const BorderSide(
              //           color: kBlackColor,
              //           width: 2.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 0.015 * screenHeight,
              ),
              TextFormField(
                controller: controller.phoneNumberController,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Phone Number',
                  prefixIcon: const Icon(
                    Icons.phone,
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
                  final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
                  if (value == null || value.isEmpty) {
                    return 'Enter Phone Number';
                  } else if (value.length <= 9) {
                    return 'number length less than 10 numbers or alphabets are present';
                  } else if (phoneRegExp.hasMatch(value)) {
                    return null;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 0.015 * screenHeight,
              ),
              // const GenderDropDown(),

              InkWell(
                onTap: () async {
                  if (EditProfile._formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: ((context) => const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: kWhiteColor,
                            ),
                          )),
                    );

                    try {
                      await FirebaseFirestore.instance
                          .collection(userCollection)
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({
                        "userEmail": controller.emailController.text.trim(),
                        "userFullName":
                            controller.fullNameController.text.trim(),
                        "userphoneNumber":
                            controller.phoneNumberController.text.trim(),
                      });
                      controller.emailController.clear();
                      controller.fullNameController.clear();
                      controller.phoneNumberController.clear();

                      errorSnackBar('Profile Updated Sucessfully', context);
                    } catch (e) {
                      errorSnackBar(e.toString(), context);
                    }

                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  height: 0.07 * screenHeight,
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
                        'Update',
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
            ],
          ),
        ),
      ),
    );
  }
}
