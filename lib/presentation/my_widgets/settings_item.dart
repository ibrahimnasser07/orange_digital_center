import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 14.sp),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp),
      ),
      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20.sp),
      onTap: onTap,
    );
  }
}
