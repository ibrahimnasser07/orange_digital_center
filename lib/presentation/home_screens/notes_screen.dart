import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/notes_cubit/notes_cubit.dart';
import '../../data/database/note_model.dart';
import '../my_widgets/note_item.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Iterable<NoteHive> notesList = [];
  late NotesCubit _notesCubit;

  @override
  void initState() {
    super.initState();
    _notesCubit = NotesCubit.get(context);
    _notesCubit.getNotes();
  }

  @override
  void didChangeDependencies() {
    _notesCubit = NotesCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _notesCubit.closeNotesBox();
  }

  @override
  Widget build(BuildContext context) {
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
          return ConditionalBuilder(
            condition: notesList.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  return Note(noteItemModel: notesList.elementAt(index));
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
