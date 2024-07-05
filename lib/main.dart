import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_income/models/income_model.dart';
import 'package:test_income/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(IncomeAdapter());
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
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xff6047a7),
        fontFamily: 'SFProText',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff6047a7),
          selectionColor: Color(0xff6047a7),
          selectionHandleColor: Color(0xff6047a7),
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xffD9D9D9).withOpacity(0.25),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
