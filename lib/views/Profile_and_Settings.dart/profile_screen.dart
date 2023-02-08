import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/Authentication/loginController.dart';
import 'package:woodie/controllers/profile_screen_controller.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/core/constants.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/shipping_address_screen.dart';
import 'package:woodie/views/OnboardingPages/main_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/edit_profile_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/help_center_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/profile_address_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final loginController = Get.put(LoginController());
    final profileController = Get.put(ProfileScreenController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.05 * screenWidth,
            left: 0.05 * screenWidth,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                    stream: profileController.getProfilePicture(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kWhiteColor,
                          ),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.docs.isNotEmpty) {
                        int val = (snapshot.data!.docs.length) - 1;
                        // for (int num = 0;
                        //     num < snapshot.data!.docs.length;
                        //     num++) {
                        //   if (snapshot.data?.docs[num]['profileImageUrl'] ==
                        //       profileController.imageUrl) {
                        //     val = num;
                        //     log('val = ${val}');
                        //   }
                        // }

                        // int pos = snapshot.data?.docs['profileImageUrl']

                        log(' photo index $val');
                        return Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 0.1 * screenHeight,
                                backgroundImage: NetworkImage(
                                  //  'assets/images/human_face_avatar.png'
                                  snapshot.data?.docs[val]['profileImageUrl'],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 98,
                              right: 0,
                              left: 90,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () async {
                                  await profileController.openGallery(context);
                                  // ignore: use_build_context_synchronously
                                  await profileController
                                      .uploadImagesToFirebase(context);
                                  // ignore: use_build_context_synchronously
                                  await profileController
                                      .uploadImgUrlToFirebaseFirestore(context);
                                },
                                icon: Container(
                                  height: 0.14 * screenHeight,
                                  width: 0.13 * screenHeight,
                                  decoration: BoxDecoration(
                                    color: kLightWhiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: kBlackColor,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 0.2 * screenWidth,
                                backgroundImage: const AssetImage(
                                  'assets/images/human_face_avatar.png',
                                ),
                              ),
                            ),
                            Positioned(
                              top: 98,
                              right: 0,
                              left: 90,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () async {
                                  await profileController.openGallery(context);
                                  // ignore: use_build_context_synchronously
                                  await profileController
                                      .uploadImagesToFirebase(context);
                                  // ignore: use_build_context_synchronously
                                  await profileController
                                      .uploadImgUrlToFirebaseFirestore(context);
                                },
                                icon: Container(
                                  height: 0.14 * screenHeight,
                                  width: 0.13 * screenHeight,
                                  decoration: BoxDecoration(
                                    color: kLightWhiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: kBlackColor,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user!.displayName ?? user.email ?? 'No Name',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const Divider(
                thickness: 3,
                color: kListTileColor,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ProfileScreenListTile(
                title: 'Edit Profile',
                onPressFunction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const EditProfile()),
                    ),
                  );
                },
                iconValue: Icons.man,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ProfileScreenListTile(
                title: 'Address',
                onPressFunction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => ProfileAddressScreen()),
                    ),
                  );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: ((context) => const ShippingAddressScreen()),
                  //   ),
                  // );
                },
                iconValue: Icons.location_on,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ProfileScreenListTile(
                title: 'Privacy Policy',
                onPressFunction: () {},
                iconValue: Icons.security,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ProfileScreenListTile(
                title: 'Help Center',
                onPressFunction: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const HelpCenterScreen())));
                },
                iconValue: Icons.info_outline_rounded,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              ProfileScreenListTile(
                title: 'LogOut',
                onPressFunction: () {
                  showLogoutBottonSheet(
                    context: context,
                    logOutFunction: () {
                      loginController.signOut(context);
                    },
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  );
                },
                iconValue: Icons.logout_outlined,
                iconColor: kRedColor,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreenListTile extends StatelessWidget {
  String title;
  VoidCallback onPressFunction;
  IconData iconValue;
  Color iconColor;
  ProfileScreenListTile({
    super.key,
    required this.title,
    required this.onPressFunction,
    required this.iconValue,
    this.iconColor = kWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: kListTileColor,
      onTap: onPressFunction,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: iconColor,
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: onPressFunction,
        icon: Icon(
          iconValue,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
