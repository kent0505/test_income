import 'package:flutter/material.dart';
import 'package:test_income/screens/home_screen.dart';
import 'package:test_income/screens/onboarding_screen.dart';
import 'package:test_income/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void check() async {
    await getData().then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return onboarding ? const OnboardingScreen() : const HomeScreen();
            },
          ),
          (route) => false,
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 200,
        ),
      ),
    );
  }
}
