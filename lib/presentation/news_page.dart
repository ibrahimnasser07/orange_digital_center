import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/business_logic/auth/login/login_cubit.dart';
import 'package:orange_digital_center/business_logic/news_cubit/news_cubit.dart';
import 'package:sizer/sizer.dart';

import '../data/models/news_model.dart';
import 'my_widgets/news_card_item.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsDataModel> newsList = [];

  @override
  void initState() {
    super.initState();
    NewsCubit.get(context).getNews(token: LoginCubit.get(context).token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("News",style: TextStyle(color: Colors.black,fontSize: 30.sp)),
        centerTitle: true,
      ),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsLoaded) {
            newsList = state.newsList;
          }
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: newsList.isNotEmpty,
            builder: (context) => ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsCardItem(newsModel: newsList[index]);
              },
            ),
            fallback: (_) => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
