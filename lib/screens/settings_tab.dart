import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24 + MediaQuery.of(context).viewPadding.top),
        const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 41),
        Image.asset(
          'assets/user.png',
          height: 160,
          width: 160,
        ),
        const SizedBox(height: 42),
        Container(
          height: 138,
          margin: const EdgeInsets.symmetric(horizontal: 36),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffFAFAFA).withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            children: [
              _SettingsButton(title: 'Terms of use'),
              _Border(),
              _SettingsButton(title: 'Privacy Policy'),
              _Border(),
              _SettingsButton(title: 'Support page'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xffFAFAFA),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SFProText',
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: const Color(0xffFAFAFA).withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _Border extends StatelessWidget {
  const _Border();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xffFAFAFA).withOpacity(0.08),
    );
  }
}
