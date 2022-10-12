import 'package:flutter/material.dart';

import '../../data/models/midterm_item_model.dart';
import '../my_widgets/midterm_item.dart';

class MidtermsScreen extends StatelessWidget {
  MidtermsScreen({Key? key}) : super(key: key);

  final List<MidtermItemModel> midtermItemModelDummyList = [
    MidtermItemModel(
        title: 'Flutter',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
    MidtermItemModel(
        title: 'React',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
    MidtermItemModel(
        title: 'Django',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
    MidtermItemModel(
        title: 'Vue',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
    MidtermItemModel(
        title: 'WordPress',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
    MidtermItemModel(
        title: 'Node.js',
        duration: '2-Hours',
        date: '20-8-2022',
        startTime: '12-PM',
        endTime: "2-PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Midterms",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.deepOrange,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child:
                Icon(Icons.cleaning_services_rounded, color: Colors.deepOrange),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: midtermItemModelDummyList.length,
        itemBuilder: (context, index) {
          return MidtermItem(
            midtermItemModel: midtermItemModelDummyList[index],
          );
        },
      ),
    );
  }
}
