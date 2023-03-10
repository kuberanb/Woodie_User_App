import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:woodie/views/Cart_and_Order_and_checkout/order_sucess_screen.dart';
import 'package:woodie/views/OnboardingPages/splash_screen.dart';
import 'package:woodie/views/Orders/order_full_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.black),
      home: const SplashScreen(), 
    );
  }
}
