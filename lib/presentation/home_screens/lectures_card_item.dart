import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/lectures_model.dart';
import '../my_widgets/default_text.dart';

class LecturesCardItem extends StatelessWidget {
  const LecturesCardItem({
    required this.lecturesModel,
    Key? key,
  }) : super(key: key);
  final LectureModel lecturesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(text: lecturesModel.lectureSubject!),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    color: Colors.deepOrange,
                  ),
                  DefaultText(text: lecturesModel.lectureDate!)
                ],
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const DefaultText(
                    text: 'Exam Date',
                    textColor: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                      ),
                      DefaultText(text: lecturesModel.lectureDate!)
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const DefaultText(
                    text: 'Start Time',
                    textColor: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.green,
                      ),
                      DefaultText(text: lecturesModel.lectureStartTime!)
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const DefaultText(
                    text: 'End Time',
                    textColor: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: Colors.red,
                      ),
                      DefaultText(text: lecturesModel.lectureEndTime!)
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
