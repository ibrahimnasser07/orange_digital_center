import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/end_points.dart';
import '../../data/models/lectures_model.dart';
import '../../data/remote/dio_helper.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  static LecturesCubit get(context) => BlocProvider.of(context);

  void getLectures({
    required String token,
  }) {
    emit(LecturesLoading());
    DioHelper.getData(
      url: lectureEndPoint,
      token: token,
    ).then((value) {
      if (value.statusCode == 200) {
        List<LectureModel> lecturesList;
        List l = jsonDecode(value.toString())['data'] as List;
        lecturesList = l.map((lecture) => LectureModel.fromJson(lecture)).toList();
        emit(LecturesLoaded(lecturesList: lecturesList));
      }
    }).catchError((error) {
      if (kDebugMode) print(error);
      emit(LecturesError());
    });
  }
}
