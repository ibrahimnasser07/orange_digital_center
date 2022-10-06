import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.pushNamed(context, "registerPage"),
      color: Colors.white,
      minWidth: double.infinity,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(width: 2, color: Colors.deepOrange),
      ),
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
