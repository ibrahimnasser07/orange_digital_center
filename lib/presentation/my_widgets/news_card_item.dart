import 'package:flutter/material.dart';
import 'package:orange_digital_center/data/models/news_model.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';
class NewsCardItem extends StatelessWidget {
  const NewsCardItem({Key? key, required this.newsModel}) : super(key: key);
  final NewsDataModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Image.network(newsModel.imageUrl!,fit: BoxFit.contain),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                DefaultText(text: newsModel.title!,fontSize: 15.sp),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 1.5.h),
                  child: DefaultText(
                    maxLines: 2,
                    fontSize: 8.sp,
                    text: newsModel.body!,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
