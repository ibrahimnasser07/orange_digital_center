import 'package:flutter/material.dart';
import 'package:orange_digital_center/my_widgets/app_title.dart';
import 'package:orange_digital_center/presentation/landing_screen.dart';
import 'package:sizer/sizer.dart';

import '../my_widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: const AppTitle(),
                  ),
                  const SizedBox(height: 80),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validation: (val) {
                            if (val == null || val.isEmpty) {
                              return "Email cannot be empty";
                            }
                          },
                        ),
                        SizedBox(height: 15.sp),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          validation: (val) {
                            if (val == null || val.isEmpty) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.sp),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          keyboardType: TextInputType.visiblePassword,
                          validation: (val) {
                            if (val == null || val.isEmpty) {
                              return "Password confirmation cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.sp),
                        CustomTextFormField(
                          controller: phoneNumberController,
                          hintText: "Phone Number",
                          keyboardType: TextInputType.number,
                          validation: (val) {
                            if (val == null || val.isEmpty) {
                              return "Phone number cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.sp),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            color: Colors.deepOrange,
                            height: 50.sp,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LandingScreen(),
                                    ),
                                    (route) => false);
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
