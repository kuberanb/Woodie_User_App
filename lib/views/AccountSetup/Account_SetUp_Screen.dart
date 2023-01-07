import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/accountSetupController.dart';
import 'package:woodie/core/colorPalettes.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(
      AccountSetUpController(),
    );
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Fill Your Profile',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 0.1 * screenHeight,
                    backgroundImage:
                        const AssetImage('assets/images/human_face_avatar.png'),
                  ),
                ),
                Positioned(
                  top: 85,
                  right: 0,
                  left: 70,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: kBlackColor,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.nameController,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.dateOfBirthController,
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
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8),
              child: GenderDropDown(),
            ),
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
                        'Submit',
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

class GenderDropDown extends StatelessWidget {
  const GenderDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AccountSetUpController());
    // final controller = Get.put(AccountSetUpController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<AccountSetUpController>(
        init: AccountSetUpController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // color: Colors.white,
              width: double.infinity,
              height: 57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kListTileColor,),
              child: DropdownButton(
                dropdownColor: Colors.black,
                // isExpanded: true,
                //  borderRadius: BorderRadius.circular(20),
                underline: Container(
                    //height: 1,
                    // color: kWhiteColor,
                    ),
                // hint: const Text(
                //   'Select Item',
                //   style: TextStyle(color: kWhiteColor, fontSize: 20),
                // ),
                // disabledHint: const Text('Select Item',style: TextStyle(color: kBlackColor,fontSize: 22),),

                style: const TextStyle(color: kWhiteColor, fontSize: 20),
                value: controller.selectedValue,
                items: controller.genderItems,
                onChanged: ((value) {
                  //   setState(() {
                  controller.selectedValue = value;
                  controller.update();
                  //  });
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
