import 'package:flutter/material.dart';

class MyShadow extends StatelessWidget {
  const MyShadow({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 0.25, //extend the shadow
          )
        ],
      ),
      child: child,
    );
  }
}
