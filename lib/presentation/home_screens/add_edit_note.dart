import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../cubit/notes_cubit.dart';
import '../../database/note_model.dart';

class AddOrEditNotes extends StatefulWidget {
  const AddOrEditNotes({Key? key, this.noteHive}) : super(key: key);
  final NoteHive? noteHive;

  @override
  State<AddOrEditNotes> createState() => _AddOrEditNotesState();
}

class _AddOrEditNotesState extends State<AddOrEditNotes> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit = NotesCubit.get(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.noteHive != null ? "Edit Note" : "Add Note"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    hintText: "Title",
                    label: const Text("Title"),
                  ),
                  initialValue:
                      widget.noteHive != null ? widget.noteHive!.title : null,
                  validator: (val) => cubit.validate(val),
                  onChanged: (val) => title = val,
                ),
                SizedBox(height: 20.sp),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    alignLabelWithHint: true,
                    labelText: "description",
                    hintText: "description",
                  ),
                  initialValue: widget.noteHive != null
                      ? widget.noteHive!.description
                      : null,
                  validator: (val) => cubit.validate(val),
                  onChanged: (val) => description = val,
                ),
                SizedBox(height: 20.sp),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.addOrUpdateNote(
                        NoteHive(
                          date:
                              DateFormat.yMd().add_jm().format(DateTime.now()),
                          title: title,
                          description: description,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  height: 35.sp,
                  minWidth: double.infinity,
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Text(
                    widget.noteHive != null ? "Edit" : "Add",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
