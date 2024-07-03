import 'package:flutter/material.dart';
import 'package:test_income/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff6047a7),
        fontFamily: 'SFProText',
      ),
      // home: const SplashScreen(),
      home: const OnboardingScreen(),
    );
  }
}
