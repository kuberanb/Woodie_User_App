import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/createAccountController.dart';
import 'package:woodie/core/colorPalettes.dart';

class CreateYourAccount extends StatelessWidget {
  const CreateYourAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(CreateAccountController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 0.4 * screenWidth,
                height: 0.2 * screenHeight,
                child: Image.asset('assets/images/logo_cropped.jpeg'),
              ),
              SizedBox(
                height: 0.05 * screenHeight,
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 0.001 * screenHeight,
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
                height: 0.001 * screenHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: controller.passwordController,
                  style: const TextStyle(color: kWhiteColor),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                        color: kPrefixIconColor,
                        size: 22,
                      ),
                    ),
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<CreateAccountController>(
                    builder: ((controller) => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                              width: 1.0, color: kPrefixIconColor),
                        ),
                        fillColor: MaterialStateProperty.all(kBlackColor),
                        activeColor: kWhiteColor,
                        value: controller.checkboxValue,
                        onChanged: (bool? value) {
                          controller.checkboxValue = value!;
                          controller.update();
                        })),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: kWhiteColor),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                          'Sign Up',
                          style: TextStyle(
                              color: kBlackColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Expanded(
                    child: Divider(
                      color: kLightGreyColor,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 0.02 * screenWidth,
                      // ),
                      SizedBox(
                        width: 0.05 * screenWidth,
                      ),
                      const Text(
                        'or Continue with',
                        style: TextStyle(color: kPrefixIconColor, fontSize: 18),
                      ),
                      SizedBox(
                        width: 0.05 * screenWidth,
                      ),
                    ],
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: kLightGreyColor,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: kListTileColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kLightGreyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 0.07 * screenHeight,
                              width: 0.07 * screenWidth,
                              child:
                                  Image.asset('assets/images/googleicon.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Google',
                              style:
                                  TextStyle(color: kWhiteColor, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 1.0),
                          child: Text(
                            "Already have an account? ",
                            style: TextStyle(color: kGreyColor, fontSize: 14),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: kGreyColor, fontSize: 16), 
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
