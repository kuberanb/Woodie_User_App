import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight,
              // child: null,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/sofaset.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 0.1 * screenWidth,
                    ),
                    const Text(
                      'Welcome to 👋',
                      style: TextStyle(color: kWhiteColor, fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.1 * screenWidth,
                    ),
                    const Text(
                      'Woodie',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 55,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                // SizedBox(width: 0.3*screenWidth,),
                Row(
                  children: [
                    SizedBox(
                      width: 0.1 * screenWidth,
                    ),
                    const Text(
                      'The best furniture e-commerce app of the',
                      style: TextStyle(color: kWhiteColor, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.1 * screenWidth,
                    ),
                    const Text(
                      'century for your daily needs!',
                      style: TextStyle(color: kWhiteColor, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.07 * screenHeight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
