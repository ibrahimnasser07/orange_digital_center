import 'package:flutter/material.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lectures Screen"),
      ),
      body: const Center(
        child: Text("Lectures Screen"),
      ),
    );
  }
}
