import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_income/models/income_model.dart';
import 'package:test_income/utils/utils.dart';
import 'package:test_income/widgets/appbar.dart';
import 'package:test_income/widgets/black_button.dart';
import 'package:test_income/widgets/txt_field.dart';

class IncomeAddScreen extends StatefulWidget {
  const IncomeAddScreen({super.key, required this.income});

  final bool income;

  @override
  State<IncomeAddScreen> createState() => _IncomeAddScreenState();
}

class _IncomeAddScreenState extends State<IncomeAddScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool buttonActive = false;

  List<IncomeModel> incomesList = [];

  Future<void> getIncomes() async {
    final box = await Hive.openBox('incomebox');
    List data = box.get('incomes') ?? [];
    setState(() {
      incomesList = data.cast<IncomeModel>();
    });
    log(incomesList.length.toString());
  }

  Future<void> updateIncomes() async {
    final box = await Hive.openBox('incomebox');
    box.put('incomes', incomesList);
    incomesList = await box.get('incomes');
  }

  void onChanged() {
    setState(() {
      if (controller1.text.isEmpty) {
        buttonActive = false;
      } else if (controller2.text.isEmpty) {
        buttonActive = false;
      } else if (controller3.text.isEmpty) {
        buttonActive = false;
      } else {
        buttonActive = true;
      }
    });
  }

  void onGo() async {
    incomesList.add(
      IncomeModel(
        id: getTimestamp(),
        target: controller1.text,
        amount: int.parse(controller2.text),
        category: controller3.text,
        income: widget.income,
      ),
    );
    await updateIncomes().then((value) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    getIncomes();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Appbar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Text(
                    widget.income ? 'Income' : 'Expense',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Text(
                      'Add a task',
                      style: TextStyle(
                        color: const Color(0xffFFFFFF).withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TxtField(
                    controller: controller1,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Text(
                      'Income amount',
                      style: TextStyle(
                        color: const Color(0xffFFFFFF).withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TxtField(
                    controller: controller2,
                    number: true,
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Text(
                      'Category',
                      style: TextStyle(
                        color: const Color(0xffFFFFFF).withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                CategoryCard(
                  title: 'Freelance',
                  controller: controller3,
                  selected: controller3.text == 'Freelance',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 12),
                CategoryCard(
                  title: 'Rent',
                  controller: controller3,
                  selected: controller3.text == 'Rent',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 12),
                CategoryCard(
                  title: 'Passive',
                  controller: controller3,
                  selected: controller3.text == 'Passive',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 12),
                CategoryCard(
                  title: 'Business',
                  controller: controller3,
                  selected: controller3.text == 'Business',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 12),
                CategoryCard(
                  title: 'Salary',
                  controller: controller3,
                  selected: controller3.text == 'Salary',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 12),
                CategoryCard(
                  title: 'Other',
                  controller: controller3,
                  selected: controller3.text == 'Other',
                  onSelected: onChanged,
                ),
                const SizedBox(height: 62),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlackButton(
                    title: 'Go!',
                    active: buttonActive,
                    onPressed: onGo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.controller,
    required this.selected,
    required this.onSelected,
  });

  final String title;
  final TextEditingController controller;
  final bool selected;
  final void Function() onSelected;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: const Color(0xffd9d9d9).withOpacity(0.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: () {
          if (widget.controller.text == widget.title) return;
          setState(() {
            widget.controller.text = widget.title;
            widget.onSelected();
          });
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 37),
            const Spacer(),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFProText',
              ),
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: widget.selected
                      ? Colors.black
                      : const Color(0xffD9D9D9).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    if (widget.selected)
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                  ]),
            ),
            const SizedBox(width: 17),
          ],
        ),
      ),
    );
  }
}
