import 'package:accordion/accordion.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../my_widgets/my_shadow.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "FAQ",
          style: TextStyle(color: Colors.black, fontSize: 25.sp),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25.sp,
              color: Colors.black,
            )),
      ),
      body: Card(
        elevation: 4.0,
        child: Accordion(
          headerBackgroundColor: Colors.white,
          scaleWhenAnimating: false,
          contentBorderColor: Colors.white,
          flipRightIconIfOpen: true,
          rightIcon: const Icon(Icons.arrow_drop_down),
          children: [
            AccordionSection(
              header: Text("How many countries Orange Digital Center are in?",
                  style: _textStyle()),
              content: Text("16 Countries", style: _textStyle()),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle() {
  return TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500);
}
