import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/business_logic/auth/login/login_cubit.dart';
import 'package:orange_digital_center/business_logic/lectures_cubit/lectures_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/lectures_model.dart';
import 'lectures_card_item.dart';

class LecturesScreen extends StatefulWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  late LecturesCubit lecturesCubit;
  List<LectureModel> lecturesList = [];

  @override
  void initState() {
    super.initState();
    lecturesCubit = LecturesCubit.get(context)
      ..getLectures(token: LoginCubit.get(context).token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lectures"),
      ),
      body: BlocConsumer<LecturesCubit, LecturesState>(
        listener: (context, state) {
          if (state is LecturesLoaded) {
            lecturesList = state.lecturesList;
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: lecturesList.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                itemCount: lecturesList.length,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.sp),
                        borderSide: const BorderSide(
                          color: Colors.teal,
                        )),
                    margin: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    child: LecturesCardItem(
                      lecturesModel: lecturesList[index],
                    ),
                  );
                },
              );
            },
            fallback: (_) => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
