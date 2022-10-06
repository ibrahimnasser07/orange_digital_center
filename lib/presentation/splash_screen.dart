import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:orange_digital_center/my_widgets/app_title.dart';
import 'package:orange_digital_center/presentation/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: const LoginPage(),
        imageSrc: 'images/Orange_logo.png',
        duration: 5000,
        speed: 100,
        text: "Orange Digital Center",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),
        colors: const [
          Colors.deepOrange,
          Colors.lightBlue,
          Colors.yellow,
          Colors.indigo,
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}

// AnimatedSplashScreen(
// duration: 1000000,
// splash: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.max,
// children: [
// Expanded(
// child: CachedNetworkImage(
// width: double.infinity,
// fit: BoxFit.fitWidth,
// imageUrl: "https://arborus.org/wp-content/uploads/2021/03/orange-logo.png",
// progressIndicatorBuilder: (context, url, downloadProgress) =>
// CircularProgressIndicator(value: downloadProgress.progress),
// errorWidget: (context, url, error) => const Icon(Icons.error),
// ),
// ),
// SizedBox(height: 50.sp)
// ],
// ),
// nextScreen: const LoginPage(),
// splashTransition: SplashTransition.fadeTransition,
// backgroundColor: Colors.white,
// )
