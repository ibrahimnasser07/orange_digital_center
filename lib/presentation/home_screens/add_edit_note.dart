import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../business_logic/notes_cubit/notes_cubit.dart';
import '../../data/database/note_model.dart';

class AddOrEditNotes extends StatefulWidget {
  const AddOrEditNotes({Key? key, this.noteHive, this.noteIndex})
      : super(key: key);
  final NoteHive? noteHive;
  final int? noteIndex;

  @override
  State<AddOrEditNotes> createState() => _AddOrEditNotesState();
}

class _AddOrEditNotesState extends State<AddOrEditNotes> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
        text: widget.noteHive != null ? widget.noteHive!.title : null);
    descriptionController = TextEditingController(
        text: widget.noteHive != null ? widget.noteHive!.description : null);
  }

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
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    hintText: "Title",
                    label: const Text("Title"),
                  ),
                  validator: (val) => cubit.validate(val),
                ),
                SizedBox(height: 20.sp),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    alignLabelWithHint: true,
                    labelText: "description",
                    hintText: "description",
                  ),
                  validator: (val) => cubit.validate(val),
                ),
                SizedBox(height: 20.sp),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.noteHive != null) {
                        cubit.updateNote(
                          widget.noteHive!.id,
                          NoteHive(
                            id: widget.noteHive!.id,
                            date: DateFormat.yMd()
                                .add_jm()
                                .format(DateTime.now()),
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        );
                      } else {
                        cubit.addNote(
                          NoteHive(
                            id: cubit.notes.length,
                            date: DateFormat.yMd()
                                .add_jm()
                                .format(DateTime.now()),
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        );
                      }
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
