import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/screens/name_screen.dart';
import 'package:test_income/widgets/black_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;
  String title = 'Welcome to banking app';
  String subtitle =
      'convenient financial manager for your\nphone, user-friendly interface, easy\ncalculation';

  void changeText(int index) {
    if (pageIndex == 0) {
      title = 'Welcome to banking app';
      subtitle =
          'convenient financial manager for your\nphone, user-friendly interface, easy\ncalculation';
    } else if (pageIndex == 1) {
      title = 'Record your income\nand expenses';
      subtitle =
          'Don\'t forget and let your spending and\nincome go to waste, you can easily\nkeep track of it in the app';
    } else {
      title = 'Evolve!';
      subtitle =
          'Take interesting tests, play quizzes, get\nnew information in a pleasant\natmosphere';
    }
  }

  void changePage(int index) {
    setState(() {
      pageIndex = index;
      changeText(pageIndex);
    });
  }

  void onNext() {
    setState(() {
      if (pageIndex == 2) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const NameScreen();
            },
          ),
          (route) => false,
        );
      }
      pageIndex++;
      changeText(pageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/ellipse1.png',
              // fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            right: 0,
            top: 300,
            child: Image.asset('assets/ellipse2.png'),
          ),
          Positioned(
            left: 0,
            bottom: 100,
            child: Image.asset('assets/ellipse3.png'),
          ),
          Column(
            children: [
              const Spacer(),
              if (pageIndex == 0)
                Image.asset('assets/rocket.png', height: 396)
              else if (pageIndex == 1)
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        right: 140,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(360 - 3 / 360),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 80,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 85,
                        right: 50,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(110 / 360),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 100,
                          ),
                        ),
                      ),
                      Image.asset('assets/hand.png', height: 396),
                      Positioned(
                        bottom: 50,
                        left: 90,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(360 - 55 / 360),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 130,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(125 / 360),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Stack(
                    children: [
                      Image.asset('assets/gold.png', height: 396),
                      Positioned(
                        right: 200,
                        bottom: 100,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(360 - 26 / 360),
                          child: Image.asset(
                            'assets/chemodan2.png',
                            height: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 225,
                        bottom: 90,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(360 - 60 / 360),
                          child: Image.asset(
                            'assets/chemodan2.png',
                            height: 25,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 45,
                        bottom: 40,
                        child: Image.asset(
                          'assets/chemodan.png',
                          height: 200,
                        ),
                      ),
                      Positioned(
                        right: 45,
                        bottom: 40,
                        child: Image.asset(
                          'assets/chemodan.png',
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              const Spacer(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xffffffff).withOpacity(0.5),
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
              // const SizedBox(height: 42),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PageIndicator(
                    active: pageIndex == 0,
                    onPressed: () {
                      changePage(0);
                    },
                  ),
                  const SizedBox(width: 5),
                  _PageIndicator(
                    active: pageIndex == 1,
                    onPressed: () {
                      changePage(1);
                    },
                  ),
                  const SizedBox(width: 5),
                  _PageIndicator(
                    active: pageIndex == 2,
                    onPressed: () {
                      changePage(2);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlackButton(
                  title: 'Next',
                  onPressed: onNext,
                ),
              ),

              const SizedBox(height: 72),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.active,
    required this.onPressed,
  });

  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 7,
        width: 36,
        decoration: BoxDecoration(
          color: active ? Colors.black : const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            if (active)
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: const Color(0xff000000).withOpacity(0.25),
                offset: const Offset(0, 4),
              ),
          ],
        ),
      ),
    );
  }
}
