import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../database/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  late Box<NoteHive> notes;

  Future<void> openNotesBox() async {
    notes = await Hive.openBox<NoteHive>('notesBox');
    if (notes != null) {
      print("OPEN BOX!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(notes.keys);
    }
    emit(NotesBoxOpened());
  }

  void addOrUpdateNote(NoteHive note) {
    openNotesBox().then((value) {
      notes.add(note);
      emit(NotesAdded());
    });
  }

  void deleteNote(int index) {
    openNotesBox().then((value) {
      notes.deleteAt(index);
      emit(NotesDeleted());
    });
  }

  void closeNotesBox() {
    notes.close().then((value) {
      emit(NotesBoxClosed());
    });
  }

  void getNotes() {
    openNotesBox().then((value) {
      emit(NotesLoaded(notes.values));
    });
  }

  String? validate(String? val) {
    if (val == null || val.isEmpty) {
      return "Cannot be empty";
    }
    return null;
  }
}
