import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/business_logic/auth/login/login_cubit.dart';
import 'package:sizer/sizer.dart';

import 'my_widgets/app_title.dart';
import 'my_widgets/forgot_password_text.dart';
import 'my_widgets/login_button.dart';
import 'my_widgets/my_divider.dart';
import 'my_widgets/signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = LoginCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        // to remove the keyboard when we tap outside the TextField
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            // to remove error when rotating the screen or when we open the kb
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: AppTitle(),
                    ),
                    SizedBox(height: 30.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: double.infinity),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              hintText: "Email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => loginCubit.validator(val),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      loginCubit.changePasswordVisibility(),
                                  icon: Icon(
                                    loginCubit.visiblePassword
                                        ? Icons.visibility_off_sharp
                                        : Icons.visibility_sharp,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: loginCubit.visiblePassword,
                              validator: (val) => loginCubit.validator(val),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const ForgotPasswordText(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30.sp, 0, 20.sp),
                      child: LoginButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginCubit.postLogin(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                    ),
                    const MyDivider(),
                    const SizedBox(height: 20),
                    const SignUpButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
