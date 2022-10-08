part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesBoxOpened extends NotesState {}

class NotesLoaded extends NotesState {
  final Iterable<NoteHive> notes;
  NotesLoaded(this.notes);
}

class NotesBoxClosed extends NotesState {}

class NotesAdded extends NotesState {}

class NotesUpdated extends NotesState {}

class NotesDeleted extends NotesState {}
