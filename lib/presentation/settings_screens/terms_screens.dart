import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:orange_digital_center/business_logic/auth/login/login_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../constants/end_points.dart';
import '../../data/remote/dio_helper.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  String terms = '';

  @override
  void initState() {
    super.initState();
    DioHelper.getData(
      url: termsEndPoint,
      token: LoginCubit.get(context).token,
    ).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          terms = jsonDecode(value.toString())['data']['Terms'] as String;
        });
      }
    }).catchError((error) {
      if (kDebugMode) print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25.sp,
              color: Colors.black,
            )),
      ),
      body: ConditionalBuilder(
        condition: terms.isNotEmpty,
        builder: (_) => SingleChildScrollView(child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: HtmlWidget(terms),
        )),
        fallback: (_) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
