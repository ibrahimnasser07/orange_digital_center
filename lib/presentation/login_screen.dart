import 'package:flutter/material.dart';

import '../my_widgets/app_title.dart';
import '../my_widgets/forgot_password_text.dart';
import '../my_widgets/login_button.dart';
import '../my_widgets/my_divider.dart';
import '../my_widgets/signup_button.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: AppTitle(),
                  ),
                  const SizedBox(height: 80),
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
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility_off_sharp
                                    : Icons.visibility_sharp,
                              ),
                            )),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _showPassword,
                      ),
                      const SizedBox(height: 20),
                      const ForgotPasswordText(),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
                    child: LoginButton(),
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
    );
  }
}
