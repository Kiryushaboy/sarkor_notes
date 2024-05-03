// ignore_for_file: must_be_immutable

part of 'notes_bloc.dart';

@immutable
class NotesState {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
}

class HomePageState extends NotesState {}

class AddNotePageState extends NotesState {}
