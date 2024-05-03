part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class HomePageEvent extends NotesEvent {}

class AddNotePageEvent extends NotesEvent {}

class AddNoteEvent extends NotesEvent {
  final String title;
  final String text;

  AddNoteEvent({
    required this.title,
    required this.text,
  });
}

class UpdateNoteEvent extends NotesEvent {
  final String title;
  final String text;
  final int index;

  UpdateNoteEvent({
    required this.title,
    required this.text,
    required this.index,
  });
}

class DeleteNoteEvent extends NotesEvent {
  final int index;

  DeleteNoteEvent(this.index);
}
