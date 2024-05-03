import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/components/note_pad.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<NoteModel>('notes_box');
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            NoteModel note = box.getAt(index)!;
            return NotePad(model: note, index: index);
          },
          itemCount: box.values.length,
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}
