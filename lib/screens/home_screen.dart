import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_income/models/income_model.dart';
import 'package:test_income/models/news_model.dart';
import 'package:test_income/screens/income_add_screen.dart';
import 'package:test_income/screens/income_edit_screen.dart';
import 'package:test_income/screens/quiz_tab.dart';
import 'package:test_income/screens/settings_tab.dart';
import 'package:test_income/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  final scrollController1 = ScrollController();
  final scrollController2 = ScrollController();
  int pageIndex = 0;
  int tabIndex = 0;

  List<IncomeModel> incomesList = [];

  Future<void> getIncomes() async {
    final box = await Hive.openBox('incomebox');
    List data = box.get('incomes') ?? [];
    setState(() {
      incomesList = data.cast<IncomeModel>();
    });
    log(incomesList.length.toString());
    for (IncomeModel income in incomesList) {
      if (income.income) {
        incomes = incomes + income.amount;
      } else {
        expenses = expenses + income.amount;
      }
    }
    await saveIncomes();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        pageIndex = controller.page!.toInt();
      });
    });
    if (tabIndex == 0) getIncomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (tabIndex == 0) ...[
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      currency == '\$'
                          ? '${convertDollarToEuro(incomes + expenses)}€'
                          : '',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    const Text(
                      'Last',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '$lastIncome$currency',
                      style: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text(
                      'Last',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '$lastExpense$currency',
                      style: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 33),
                _AddButton(
                  income: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const IncomeAddScreen(income: true);
                        },
                      ),
                    ).then((value) async {
                      log('GET CALLED');
                      await getIncomes();
                    });
                  },
                ),
                const Spacer(),
                _AddButton(
                  income: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const IncomeAddScreen(income: false);
                        },
                      ),
                    ).then((value) async {
                      log('GET CALLED');
                      await getIncomes();
                    });
                  },
                ),
                const SizedBox(width: 33),
              ],
            ),
            const SizedBox(height: 23),
          ],
          if (tabIndex == 1) ...[
            const QuizTab(),
          ],
          if (tabIndex == 2) ...[
            const SettingsTab(),
          ],
          if (tabIndex == 0)
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
                    Text(
                      pageIndex == 0
                          ? 'History'
                          : pageIndex == 1
                              ? 'News'
                              : 'Exchange',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _PageIndicator(active: pageIndex == 0),
                        const SizedBox(width: 5),
                        _PageIndicator(active: pageIndex == 1),
                        const SizedBox(width: 5),
                        _PageIndicator(active: pageIndex == 2),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: PageView(
                        controller: controller,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          RawScrollbar(
                            controller: scrollController1,
                            padding: const EdgeInsets.only(right: 8),
                            thumbColor:
                                const Color(0xff3200BF).withOpacity(0.5),
                            radius: const Radius.circular(12),
                            thumbVisibility: true,
                            thickness: 7,
                            child: ListView(
                              controller: scrollController1,
                              padding: const EdgeInsets.all(24),
                              children: [
                                ...List.generate(
                                  incomesList.length,
                                  (index) {
                                    return _IncomeCard(
                                      model: incomesList[index],
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return IncomeEditScreen(
                                                model: incomesList[index],
                                              );
                                            },
                                          ),
                                        ).then((value) async {
                                          log('GET CALLED');
                                          await getIncomes();
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          RawScrollbar(
                            padding: const EdgeInsets.only(right: 8),
                            controller: scrollController2,
                            thumbColor:
                                const Color(0xff3200BF).withOpacity(0.5),
                            radius: const Radius.circular(12),
                            thumbVisibility: true,
                            thickness: 7,
                            child: ListView(
                              controller: scrollController2,
                              padding: const EdgeInsets.all(24),
                              children: [
                                ...List.generate(
                                  newsData.length,
                                  (index) {
                                    return _NewsDataCard(
                                      model: newsData[index],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            children: [
                              SizedBox(height: 22),
                              _ExchangeCard(),
                            ],
                          ),
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
            index: tabIndex,
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    required this.income,
    required this.onPressed,
  });

  final bool income;
  final void Function() onPressed;

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
        onPressed: onPressed,
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

class _IncomeCard extends StatelessWidget {
  const _IncomeCard({
    required this.model,
    required this.onPressed,
  });

  final IncomeModel model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.income ? 'Income' : 'Expense',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFProText',
                    ),
                  ),
                  Text(
                    model.target,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xffffffff).withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFProText',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '${model.amount}$currency',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'SFProText',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 90,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    model.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SFProText',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          if (active)
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            )
        ],
      ),
    );
  }
}

class _ExchangeCard extends StatelessWidget {
  const _ExchangeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.24),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/usd.svg'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'USD',
                    style: TextStyle(
                      color: Color(0xffFAFAFA),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                '\$1,00',
                style: TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFA).withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SvgPicture.asset('assets/swap.svg'),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'USD',
                    style: TextStyle(
                      color: Color(0xffFAFAFA),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/eur.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                '€0,92',
                style: TextStyle(
                  color: Color(0xffFAFAFA),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _NewsDataCard extends StatelessWidget {
  const _NewsDataCard({required this.model});

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xff000000).withOpacity(0.24),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  height: 67,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      model.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      model.subtitle,
                      maxLines: 3,
                      style: TextStyle(
                        color: const Color(0xffffffff).withOpacity(0.5),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            const Spacer(),
            Text(
              model.date,
              style: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.5),
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 3),
            Container(
              height: 3,
              width: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xffffffff).withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
