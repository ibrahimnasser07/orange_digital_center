import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../my_widgets/app_title.dart';
import '../my_widgets/home_page_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.sp),
            child: const AppTitle(),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: const <Widget>[
                HomePageCardItem(
                  icon: Icons.menu_book,
                  label: "Lectures",
                  goToPage: "lecturesScreen",
                ),
                HomePageCardItem(
                  icon: Icons.group,
                  label: "Sections",
                  goToPage: "sectionsScreen",
                ),
                HomePageCardItem(
                  icon: Icons.library_books_rounded,
                  label: "Midterms",
                  goToPage: "midtermsScreen",
                ),
                HomePageCardItem(
                  icon: Icons.my_library_books_outlined,
                  label: "Finals",
                  goToPage: "finalsScreen",
                ),
                HomePageCardItem(
                  icon: Icons.calendar_month,
                  label: "Events",
                  goToPage: "eventsScreen",
                ),
                HomePageCardItem(
                  icon: Icons.note_add_sharp,
                  label: "Notes",
                  goToPage: "notesScreen",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
