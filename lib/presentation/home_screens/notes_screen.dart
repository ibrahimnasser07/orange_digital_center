import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/database/note_model.dart';

import '../../cubit/notes_cubit.dart';
import '../../my_widgets/note_item.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late Iterable<NoteHive>? notesList;

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit = NotesCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is NotesLoaded) {
            notesList = state.notes;
          }
        },
        builder: (context, state) {
          cubit.getNotes();
          return ConditionalBuilder(
            condition: notesList != null,
            builder: (context) {
              print("NotesList is not null");
              return ListView.builder(
                itemCount: notesList!.length,
                itemBuilder: (context, index) {
                  return Note(noteItemModel: notesList!.elementAt(index));
                },
              );
            },
            fallback: (context) {
              return const Center(
                child: Text("No Notes yet!!"),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, "addOrEditNotes"),
      ),
    );
  }
}
