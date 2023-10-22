// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:manekin/page/dashboard-page.dart';
import 'package:manekin/page/login-page.dart';
import 'package:manekin/page/profile/profil-page.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:manekin/page/tentang_kami/about_us.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'Mannequin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: AnimatedSplashScreen(
          duration: 3000,
          splashIconSize: 200,
          pageTransitionType: PageTransitionType.fade,
          splash: 'assets/circle-rg.png',
          nextScreen: const MyLoginPage(),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.grey.shade700),
    );
  }
}
