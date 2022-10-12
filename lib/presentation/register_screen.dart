import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:orange_digital_center/business_logic/auth/register/register_cubit.dart';
import 'package:sizer/sizer.dart';

import 'my_widgets/app_title.dart';
import 'my_widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final nameController = TextEditingController(text: "ibrahim");

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final phoneNumberController = TextEditingController();

  String gender = 'm';

  late RegisterCubit _registerCubit;

  @override
  void initState() {
    _registerCubit = RegisterCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: SingleChildScrollView(
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
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
                                return null;
                              },
                            ),
                            SizedBox(height: 15.sp),
                            CustomTextFormField(
                              controller: passwordController,
                              hintText: "Password",
                              obscureText: _registerCubit.visiblePassword,
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    _registerCubit.changePasswordVisibility(),
                                icon: Icon(
                                  _registerCubit.visiblePassword
                                      ? Icons.visibility_off_sharp
                                      : Icons.visibility_sharp,
                                ),
                              ),
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
                              obscureText: _registerCubit.visibleConfirmPassword,
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    _registerCubit.changeConfirmPasswordVisibility(),
                                icon: Icon(
                                  _registerCubit.visibleConfirmPassword
                                      ? Icons.visibility_off_sharp
                                      : Icons.visibility_sharp,
                                ),
                              ),
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
                            GenderPickerWithImage(
                              verticalAlignedText: false,
                              selectedGender: Gender.Male,
                              selectedGenderTextStyle: const TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                              unSelectedGenderTextStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              onChanged: (Gender? g) {
                                gender = g == Gender.Male ? "m" : "f";
                              },
                              equallyAligned: true,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              isCircular: true,
                              // default : true,
                              opacityOfGradient: 0.3,
                              padding: const EdgeInsets.all(3),
                              size: 55.sp, //default : 40
                            ),
                            SizedBox(height: 15.sp),
                            SizedBox(
                              width: double.infinity,
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                height: 50.sp,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _registerCubit.postRegister(
                                      name: nameController.text.toString(),
                                      email: emailController.text.toString(),
                                      password: passwordController.text.toString(),
                                      phoneNumber: phoneNumberController.text.toString(),
                                      gender: gender.toString(),
                                      context: context,
                                    );
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
