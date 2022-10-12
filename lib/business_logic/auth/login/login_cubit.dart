import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/models/auth/login_model.dart';
import '../../../data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool visiblePassword = false;
  late String token;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(PasswordVisibilityState());
  }

  String? validator(String? val) {
    if (val == null || val.isEmpty) {
      return "Cannot be empty";
    }
    return null;
  }

  void postLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode == 200) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("landingScreen", (_) => false);
        flutterToast(msg: 'Logged in Successfully', color: Colors.green);
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
        token = value.data['data']['accessToken'];
      }
    }).catchError((error) {
      if (kDebugMode) print(error);
      emit(LoginErrorState());
    });
  }
}
