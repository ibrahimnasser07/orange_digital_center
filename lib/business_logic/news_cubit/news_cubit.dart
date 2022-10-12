import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/constants/end_points.dart';
import 'package:orange_digital_center/data/models/news_model.dart';

import '../../data/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  void getNews({
    required String token,
  }) {
    emit(NewsLoading());
    DioHelper.getData(
      url: newsEndPoint,
      token: token,
    ).then((value) {
      if (value.statusCode == 200) {
        print(value.toString());
        List<NewsDataModel> newsList;
        List l = jsonDecode(value.toString())['data'] as List;
        newsList = l.map((news) => NewsDataModel.fromJson(news)).toList();
        emit(NewsLoaded(newsList: newsList));
      }
    }).catchError((error) {
      if (kDebugMode) print(error);
      emit(NewsError());
    });
  }
}
