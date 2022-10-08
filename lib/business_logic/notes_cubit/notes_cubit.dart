import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../data/database/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  late Box<NoteHive> notes;

  Future<void> openNotesBox() async {
    notes = await Hive.openBox<NoteHive>('notesBox');
    emit(NotesBoxOpened());
  }

  void getNotes() {
    openNotesBox().then((_) => emit(NotesLoaded(notes.values)));
  }

  void addNote(NoteHive note) {
      notes.add(note);
      emit(NotesAdded());
  }

  void updateNote(int index, NoteHive note) {
      notes.putAt(index, note);
      emit(NotesUpdated());
  }

  void deleteNote(int index) {
      notes.deleteAt(index);
      emit(NotesDeleted());
  }

  void closeNotesBox() {
    notes.close().then((_) => emit(NotesBoxClosed()));
  }

  String? validate(String? val) {
    val == null || val.isEmpty ? "Cannot be empty" : null;
    return null;
    }
  }
