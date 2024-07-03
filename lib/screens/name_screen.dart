import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/widgets/black_button.dart';
import 'package:test_income/widgets/txt_field.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;

  void onChanged() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onSelectCurrency(String currency) {
    controller2.text = currency;
    onChanged();
  }

  void onGo() {
    log(controller1.text);
    log(controller2.text);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: Image.asset('assets/sun.png'),
            ),
          ),
          // const SizedBox(height: 74),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your name',
                  style: TextStyle(
                    color: const Color(0xffffffff).withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 7),
                TxtField(
                  controller: controller1,
                  hintText: '...',
                  onChanged: onChanged,
                ),
                const SizedBox(height: 10),
                Text(
                  'What currencies you prefer',
                  style: TextStyle(
                    color: const Color(0xffffffff).withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CurrencySelectButton(
                      currency: '\$',
                      selected: controller2.text == '\$',
                      onPressed: () {
                        onSelectCurrency('\$');
                      },
                    ),
                    const Spacer(),
                    _CurrencySelectButton(
                      currency: '€',
                      selected: controller2.text == '€',
                      onPressed: () {
                        onSelectCurrency('€');
                      },
                    ),
                    const Spacer(),
                    _CurrencySelectButton(
                      currency: '₺',
                      selected: controller2.text == '₺',
                      onPressed: () {
                        onSelectCurrency('₺');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Center(
                  child: Text(
                    'Your option',
                    style: TextStyle(
                      color: const Color(0xffffffff).withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: SizedBox(
                    width: 196,
                    child: TxtField(
                      controller: controller2,
                      limit: 1,
                      borderRadius: 12,
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlackButton(
              title: 'Go',
              active: active,
              onPressed: onGo,
            ),
          ),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}

class _CurrencySelectButton extends StatelessWidget {
  const _CurrencySelectButton({
    required this.currency,
    required this.selected,
    required this.onPressed,
  });

  final String currency;
  final bool selected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 90,
      decoration: BoxDecoration(
        color:
            selected ? Colors.black : const Color(0xffD9D9D9).withOpacity(0.24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            currency,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}
