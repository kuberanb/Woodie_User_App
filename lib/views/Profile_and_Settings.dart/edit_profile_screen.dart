import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/AccountSetup/account_setup_Screen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //  controller: controller.nameController,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //  controller: controller.emailController,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //  controller: controller.dateOfBirthController,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.date_range_outlined,
                      color: kPrefixIconColor,
                    ),
                  ),
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Date of Birth',
                  prefixIcon: const Icon(
                    Icons.text_fields_outlined,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //  controller: controller.phoneNumberController,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            const GenderDropDown(),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
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
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
