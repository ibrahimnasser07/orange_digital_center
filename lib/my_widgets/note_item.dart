import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../database/note_model.dart';

class Note extends StatelessWidget {
  const Note({Key? key, required this.noteItemModel}) : super(key: key);
  final NoteHive noteItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.sp),
      child: ListTile(
        dense: false,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteItemModel.title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(noteItemModel.description, overflow: TextOverflow.ellipsis),
          ],
        ),
        subtitle: Text(noteItemModel.date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "addOrEditNotes",
                    arguments: noteItemModel);
              },
              icon: const Icon(Icons.edit, color: Colors.green),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
