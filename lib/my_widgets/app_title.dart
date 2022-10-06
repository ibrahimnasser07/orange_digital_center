import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Orange",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
            fontSize: 30,
          ),
        ),
        Text(
          " Digital Center",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
