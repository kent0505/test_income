import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/screens/income_add_screen.dart';
import 'package:test_income/screens/quiz_tab.dart';
import 'package:test_income/screens/settings_tab.dart';
import 'package:test_income/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (pageIndex == 0) ...[
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
          if (pageIndex == 1) ...[
            const QuizTab(),
          ],
          if (pageIndex == 2) ...[
            const SettingsTab(),
          ],
          if (pageIndex == 0)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9).withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 11),
                    const Text('History'),
                    const SizedBox(height: 8),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(24),
                        children: const [
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                          Text('Aaa'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            const Spacer(),
          TabWidget(
            index: pageIndex,
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
            },
          ),
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
                return IncomeAddScreen(income: income);
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

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index == 0 ? const Color(0xffD9D9D9).withOpacity(0.3) : null,
      height: 60,
      child: Row(
        children: [
          const SizedBox(width: 50),
          SizedBox(
            width: 60,
            child: CupertinoButton(
              onPressed: () {
                onTap(0);
              },
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  Icon(
                    Icons.home,
                    color: index == 0
                        ? const Color(0xffFAFAFA)
                        : const Color(0xffFAFAFA).withOpacity(0.4),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: index == 0
                          ? const Color(0xffFAFAFA)
                          : const Color(0xffFAFAFA).withOpacity(0.4),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText',
                    ),
                  ),
                  const Spacer(),
                  if (index == 0)
                    Container(
                      height: 4,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 60,
            child: CupertinoButton(
              onPressed: () {
                onTap(1);
              },
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  Image.asset(
                    'assets/quiz_tab.png',
                    height: 30,
                    color: index == 1
                        ? const Color(0xffFAFAFA)
                        : const Color(0xffFAFAFA).withOpacity(0.4),
                  ),
                  Text(
                    'Quiz',
                    style: TextStyle(
                      color: index == 1
                          ? const Color(0xffFAFAFA)
                          : const Color(0xffFAFAFA).withOpacity(0.4),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText',
                    ),
                  ),
                  const Spacer(),
                  if (index == 1)
                    Container(
                      height: 4,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 60,
            child: CupertinoButton(
              onPressed: () {
                onTap(2);
              },
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  Icon(
                    Icons.settings,
                    color: index == 2
                        ? const Color(0xffFAFAFA)
                        : const Color(0xffFAFAFA).withOpacity(0.4),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: index == 2
                          ? const Color(0xffFAFAFA)
                          : const Color(0xffFAFAFA).withOpacity(0.4),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText',
                    ),
                  ),
                  const Spacer(),
                  if (index == 2)
                    Container(
                      height: 4,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}
