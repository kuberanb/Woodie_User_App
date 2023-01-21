import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/Authentication/loginController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/functions/MiscellaneousFunctions.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/shipping_address_screen.dart';
import 'package:woodie/views/OnboardingPages/main_screen.dart';
import 'package:woodie/views/Profile_and_Settings.dart/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final loginController = Get.put(LoginController());

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
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 0.1 * screenHeight,
                          backgroundImage: const AssetImage(
                            'assets/images/human_face_avatar.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 92,
                        right: 0,
                        left: 90,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Container(
                            height: 0.15 * screenHeight,
                            width: 0.15 * screenHeight,
                            decoration: BoxDecoration(
                              color: kLightWhiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.edit_outlined,
                              color: kBlackColor,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    user!.email ?? 'Unknown Email',
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
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
                      builder: ((context) => const ShippingAddressScreen()),
                    ),
                  );
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
                onPressFunction: () {},
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
