import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Forgot Password?",
      style: TextStyle(
        color: Colors.deepOrange,
        decoration: TextDecoration.underline,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}