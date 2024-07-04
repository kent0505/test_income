import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, this.onDelete});

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      // color: Colors.greenAccent,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            child: const Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 15),
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProText',
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          if (onDelete != null) ...[
            const Spacer(),
            CupertinoButton(
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              child: const Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFProText',
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
