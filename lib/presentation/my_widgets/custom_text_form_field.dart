import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller, required this.keyboardType, required this.validation,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hintText,
        label: Text(hintText),
      ),
      keyboardType: keyboardType,
      validator: validation,
    );
  }
}
