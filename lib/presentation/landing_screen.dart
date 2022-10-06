import 'package:flutter/material.dart';
import 'package:orange_digital_center/presentation/home_page.dart';
import 'package:orange_digital_center/presentation/settings_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

import 'news_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;

  List<Widget> currentPage = const [HomePage(), NewsPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: SafeArea(
        child: Scaffold(
          body: currentPage[_currentIndex],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            margin: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.deepOrange,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.newspaper),
                title: const Text("News"),
                selectedColor: Colors.orange,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: const Text("Settings"),
                selectedColor: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> onBackPressed(BuildContext context) async {
  final shouldPop = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Do you want to exit the app?'),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
  return shouldPop!;
}
