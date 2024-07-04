import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/screens/income_add_page.dart';
import 'package:test_income/screens/settings_screen.dart';
import 'package:test_income/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (pageIndex == 0) ...[
            const SettingsScreen(),
          ],
          if (pageIndex == 1) ...[
            const Text('Quiz'),
          ],
          if (pageIndex == 2) ...[
            SizedBox(height: 9 + MediaQuery.of(context).viewPadding.top),
            Center(
              child: Text(
                'Hello $username',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        color: const Color(0xffFFFFFF).withOpacity(0.5),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${incomes + expenses}$currency',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: Colors.white,
                    ),
                    Text(
                      '${incomes + expenses}€',
                      style: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.5),
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const Text(
                      'Income',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 26,
                      width: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '$incomes$currency',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const Text(
                      'Expense',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 26,
                      width: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          '$expenses$currency',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 33),
                _AddButton(true),
                Spacer(),
                _AddButton(false),
                SizedBox(width: 33),
              ],
            ),
            const SizedBox(height: 23),
          ],
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton(this.income);

  final bool income;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.25),
        borderRadius: BorderRadius.circular(18),
      ),
      child: CupertinoButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return IncomeAddPage(income: income);
              },
            ),
          );
        },
        padding: EdgeInsets.zero,
        child: Text(
          income ? 'Income' : 'Expense',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
