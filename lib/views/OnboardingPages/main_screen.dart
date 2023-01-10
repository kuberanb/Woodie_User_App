import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';
import 'package:woodie/views/BottomNavigationbar/navigation_screen.dart';
import 'package:woodie/views/LetsIn(login,signin,signup)/loginyourAccount.dart';
import 'package:woodie/views/OnboardingPages/auth_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kWhiteColor,
                strokeWidth: 2,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went Wrong', 
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return const NavigationScreen();
          } else {
            return const AuthPage();
          }
        }),
      ),
    );
  }
}
