import 'package:flutter/material.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sections Screen"),
      ),
      body: const Center(
        child: Text("Sections Screen"),
      ),
    );
  }
}
