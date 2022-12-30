import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/forgot_passwordController.dart';
import 'package:woodie/core/colorPalettes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: kWhiteColor,
            )),
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.01 * screenHeight),
          child: Column(
            children: [
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Center(
                child: Text(
                  'Send password reset link to the below email',
                  style: TextStyle(color: kGreyColor, fontSize: 18),
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

              InkWell(
              onTap: () {
                print('hello how are you');
              },
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
      ),
    );
  }
}
