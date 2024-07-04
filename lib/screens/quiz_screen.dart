import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/models/quiz_model.dart';
import 'package:test_income/widgets/appbar.dart';
import 'package:test_income/widgets/black_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.index});

  final int index;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizModel> quizes = [];
  AnswerModel answer = AnswerModel(answer: '', correct: false);
  int questionIndex = 0;
  int correctAnswers = 0;
  bool buttonActive = false;
  bool answerButtonActive = true;
  bool snackBar = false;
  bool scorePage = false;

  void onNext() {
    setState(() {
      if (answer.correct) correctAnswers++;
      log(correctAnswers.toString());
      buttonActive = false;
      snackBar = true;
      answerButtonActive = false;
    });
  }

  void onSnackNext() {
    setState(() {
      if (questionIndex == 4) scorePage = true;
      questionIndex++;
      snackBar = false;
      answerButtonActive = true;
    });
  }

  void check(AnswerModel answerModel) {
    setState(() {
      answer = answerModel;
      buttonActive = true;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index == 0) quizes = bankQuizes;
    if (widget.index == 1) quizes = financeQuizes;
    if (widget.index == 2) quizes = cryptoQuizes;
    quizes.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scorePage
          ? Column(
              children: [
                SizedBox(height: 24 + MediaQuery.of(context).viewPadding.top),
                const Text(
                  'Score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 17),
                Text(
                  '$correctAnswers/5',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlackButton(
                    title: 'Go to quiz!',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 85),
              ],
            )
          : Stack(
              children: [
                Column(
                  children: [
                    const Appbar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${questionIndex + 1}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Text(
                                  ' / 5',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Stack(
                              children: [
                                Container(
                                  height: 14,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD9D9D9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  height: 14,
                                  width: 32 * questionIndex.toDouble() + 32,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 27),
                            Container(
                              height: 170,
                              width: 320,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              quizes[questionIndex].question,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFProText',
                              ),
                            ),
                            ...List.generate(
                              3,
                              (index) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 27),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: _AnswerButton(
                                        answerModel: quizes[questionIndex]
                                            .answers[index],
                                        selected: answer.answer ==
                                            quizes[questionIndex]
                                                .answers[index]
                                                .answer,
                                        active: answerButtonActive,
                                        onPressed: (model) {
                                          check(model);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const Spacer(),
                            BlackButton(
                              title: 'Next',
                              active: buttonActive,
                              onPressed: onNext,
                            ),
                            const SizedBox(height: 85),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (snackBar)
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: answer.correct
                          ? const Color(0xff46934E)
                          : const Color(0xffBA3131),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        Center(
                          child: Text(
                            answer.correct ? 'Correct!' : 'Incorrect!',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 35,
                          width: 190,
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9).withOpacity(0.25),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: CupertinoButton(
                            onPressed: onSnackNext,
                            padding: EdgeInsets.zero,
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SFProText',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 84),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.answerModel,
    required this.selected,
    required this.active,
    required this.onPressed,
  });

  final AnswerModel answerModel;
  final bool selected;
  final bool active;
  final void Function(AnswerModel) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 42,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xffD9D9D9).withOpacity(0.25)
            : answerModel.correct
                ? const Color(0xff46934E)
                : const Color(0xffBA3131),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: active
            ? () {
                onPressed(answerModel);
              }
            : null,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                answerModel.answer,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProText',
                ),
              ),
            ),
            const SizedBox(width: 9),
            active
                ? Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: selected
                          ? Colors.black
                          : const Color(0xffffffff).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        if (selected)
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.25),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(0, 4),
                          ),
                      ],
                    ),
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
