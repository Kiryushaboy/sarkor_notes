import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/model/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  var box = Hive.box<NoteModel>('notes_box');
  NotesBloc() : super(NotesState()) {
    on<HomePageEvent>((event, emit) => emit(HomePageState()));
    on<AddNotePageEvent>((event, emit) => emit(AddNotePageState()));
    on<AddNoteEvent>(_addNewNote);
    on<UpdateNoteEvent>(_updateNote);
    on<DeleteNoteEvent>(_deleteNote);
  }

  Future<void> _addNewNote(AddNoteEvent event, Emitter<NotesState> emit) async {
    var noteModel = NoteModel(
      title: event.title,
      text: event.text,
    );

    box.add(noteModel);
    emit(HomePageState());
  }

  Future<void> _updateNote(
      UpdateNoteEvent event, Emitter<NotesState> emit) async {
    var noteModel = NoteModel(
      title: event.title,
      text: event.text,
    );

    box.putAt(event.index, noteModel);
    emit(HomePageState());
  }

  Future<void> _deleteNote(
      DeleteNoteEvent event, Emitter<NotesState> emit) async {
    box.deleteAt(event.index);
    emit(HomePageState());
  }
}
