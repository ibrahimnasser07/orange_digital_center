import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Expanded(
          child: Divider(
            color: Colors.black,
            endIndent: 8,
            thickness: 1,
          ),
        ),
        Text(
          "OR",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Divider(
            indent: 8,
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}