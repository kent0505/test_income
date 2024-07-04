import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;
String username = '';
String currency = '\$';
int expenses = 0;
int incomes = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  username = prefs.getString('username') ?? 'User';
  currency = prefs.getString('currency') ?? '\$';
  expenses = prefs.getInt('expenses') ?? 0;
  incomes = prefs.getInt('incomes') ?? 0;

  log('onboarding = $onboarding');
  log('username = $username');
  log('currency = $currency');
  log('expenses = $expenses');
  log('incomes = $incomes');
}

Future<void> saveUser(String name, String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('username', name);
  prefs.setString('currency', currency);
  prefs.setBool('onboarding', false);
  await getData();
}

Future<void> saveIncomes() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('expenses', expenses);
  prefs.setInt('incomes', incomes);
  await getData();
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
