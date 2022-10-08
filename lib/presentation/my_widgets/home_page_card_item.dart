import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageCardItem extends StatelessWidget {
  const HomePageCardItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.goToPage,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final String goToPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, goToPage),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[100]),
              padding: EdgeInsets.all(13.sp),
              child: Icon(icon, color: Colors.deepOrange, size: 30.sp),
            ),
            Text(
              label,
              style: TextStyle(color: Colors.deepOrange, fontSize: 15.sp),
            )
          ],
        ),
      ),
    );
  }
}
