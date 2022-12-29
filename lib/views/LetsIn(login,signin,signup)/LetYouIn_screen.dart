import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie/core/colorPalettes.dart';

class LetYouInPage extends StatelessWidget {
  const LetYouInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 0.4 * screenWidth,
                height: 0.4 * screenHeight,
                child: Image.asset('assets/images/logo.jpeg'),
              ),
            ),
            const Text(
              "Let's you in",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 50,
              ),
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
                            child: Image.asset('assets/images/googleicon.png'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(color: kWhiteColor, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0.02 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                      'ok',
                      style: TextStyle(color: kWhiteColor, fontSize: 18),
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
            // SizedBox(
            //   height: 0.02 * screenHeight,
            // ),
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
                        'Sign in with Password',
                        style: TextStyle(color: kBlackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 3.0),
                  child: Text(
                    "Don't have an account? ",
                    style: TextStyle(color: kWhiteColor, fontSize: 17),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: kWhiteColor, fontSize: 20),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
