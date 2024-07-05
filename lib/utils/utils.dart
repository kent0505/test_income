import 'package:shared_preferences/shared_preferences.dart';

bool onboarding = true;
String username = '';
String currency = '\$';
int expenses = 0;
int incomes = 0;
int lastExpense = 0;
int lastIncome = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  username = prefs.getString('username') ?? 'User';
  currency = prefs.getString('currency') ?? '\$';
  expenses = prefs.getInt('expenses') ?? 0;
  incomes = prefs.getInt('incomes') ?? 0;
  lastExpense = prefs.getInt('lastExpense') ?? 0;
  lastIncome = prefs.getInt('lastIncome') ?? 0;
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

Future<void> saveLastIncomes(bool income, int value) async {
  final prefs = await SharedPreferences.getInstance();
  if (income) {
    prefs.setInt('lastIncome', value);
  } else {
    prefs.setInt('lastExpense', value);
  }
  await getData();
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

int convertDollarToEuro(int dollars) {
  double euroRate = 0.92;
  double euros = dollars * euroRate;
  return euros.toInt();
}
