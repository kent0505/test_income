import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_income/screens/quiz_screen.dart';

class QuizTab extends StatelessWidget {
  const QuizTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 24 + MediaQuery.of(context).viewPadding.top),
          const Text(
            'Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Test your financial knowledge',
            style: TextStyle(
              color: const Color(0xffffffff).withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 33),
          const _QuizCard(
            title: 'What do you know\nabout banks?',
            subtitle: 'Test your skills and\nlearn new things',
            asset: 'bank',
            index: 0,
          ),
          const SizedBox(height: 33),
          const _QuizCard(
            title: 'Financial skills',
            subtitle: 'Test your skills in\nfinancial knowledge',
            asset: 'chemodan2',
            fontSize: 24,
            index: 1,
          ),
          const SizedBox(height: 33),
          const _QuizCard(
            title: 'Do you know\ncryptocurrency?',
            subtitle: 'Test your skills in\ncryptocurrency',
            asset: 'crypto',
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({
    required this.title,
    required this.subtitle,
    required this.asset,
    this.fontSize = 16,
    required this.index,
  });

  final String title;
  final String subtitle;
  final String asset;
  final double fontSize;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CupertinoButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return QuizScreen(index: index);
              },
            ),
          );
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: Image.asset(
                'assets/$asset.png',
                height: 70,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProText',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0xffffffff).withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProText',
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
