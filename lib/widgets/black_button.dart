import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'SFProText',
            ),
          ),
        ),
      ),
    );
  }
}
