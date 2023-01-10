import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/controllers/Authentication/googleSignInController.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/createyourAccount.dart';
import 'package:woodie/views/forgot_reset_password/forgot_password_screen.dart';

import '../../controllers/Authentication/loginController.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({super.key, required this.onClickedSignUp});

  static final formKey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(LoginController());
    final googleController = Get.put(GoogleSignInController());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: kBackgroundColor,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: kWhiteColor,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: LoginPage.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
                  SizedBox(
                    width: 0.4 * screenWidth,
                    height: 0.2 * screenHeight,
                    child: Image.asset('assets/images/logo_cropped.jpeg'),
                  ),
                  SizedBox(
                    height: 0.05 * screenHeight,
                  ),
                  const Text(
                    "Login to your Account",
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
                          onPressed: () {
                            controller.passwordController.clear();
                          },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password';
                        } else if (value.length <= 7) {
                          return 'Enter Password Length greater than 7 letters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<LoginController>(
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
                  InkWell(
                    onTap: () {
                      if (LoginPage.formKey.currentState!.validate()) {
                        controller.signIn(context);
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16.0, right: 16, left: 16),
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
                              'Sign In',
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const ForgotPasswordScreen()),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot the Password?',
                          style: TextStyle(color: kWhiteColor, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                style: TextStyle(
                                    color: kPrefixIconColor, fontSize: 18),
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
                    padding:
                        const EdgeInsets.only(top: 16.0, right: 16, left: 16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            googleController.googleLogin(context);
                          },
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
                                  child: Image.asset(
                                      'assets/images/googleicon.png'),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                      color: kWhiteColor, fontSize: 18),
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
                                "Don't have an Account? ",
                                style:
                                    TextStyle(color: kGreyColor, fontSize: 14),
                              ),
                            ),
                            TextButton(
                                onPressed: widget.onClickedSignUp,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: kGreyColor, fontSize: 16),
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
        ),
      ),
    );
  }
}
