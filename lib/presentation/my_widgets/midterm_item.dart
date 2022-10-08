import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/midterm_item_model.dart';

class MidtermItem extends StatelessWidget {
  const MidtermItem({
    Key? key, required this.midtermItemModel,
  }) : super(key: key);
  final MidtermItemModel midtermItemModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.sp,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(midtermItemModel.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
                  Row(
                    children: [
                      const Icon(Icons.timer),
                      Text(midtermItemModel.duration),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.sp),
                        child: const Text("Exam Date"),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          Text(midtermItemModel.date)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.sp),
                        child: const Text("Start Time"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.access_time_sharp,
                              color: Colors.green),
                          Text(midtermItemModel.startTime)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.sp),
                        child: const Text("End time"),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time_sharp,
                              color: Colors.redAccent),
                          Text(midtermItemModel.endTime)
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
