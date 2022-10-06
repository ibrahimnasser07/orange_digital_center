import 'package:flutter/material.dart';

class FinalsScreen extends StatelessWidget {
  const FinalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finals Screen"),
      ),
      body: const Center(
        child: Text("Finals Screen"),
      ),
    );
  }
}
