import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/components/error_alert_dialog.dart';
import 'package:notes_app/ui/style/app_style.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({super.key, this.index = 0, this.model});

  final int index;
  final NoteModel? model;

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is AddNotePageState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => noteBloc.add(HomePageEvent()),
                child: const Text('Отмена', style: AppStyle.buttonStyle),
              ),
              TextButton(
                onPressed: () {
                  if (state.titleController.text.isEmpty ||
                      state.textController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => const ErrorAlertDialog());
                  } else {
                    noteBloc.add(
                      AddNoteEvent(
                        title: state.titleController.text.trim(),
                        text: state.textController.text.trim(),
                      ),
                    );
                    state.titleController.clear();
                    state.textController.clear();
                  }
                },
                child: const Text('Сохранить', style: AppStyle.buttonStyle),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Отмена', style: AppStyle.buttonStyle),
              ),
              TextButton(
                onPressed: () {
                  if (state.titleController.text.isEmpty ||
                      state.textController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => const ErrorAlertDialog());
                  } else {
                    noteBloc.add(
                      UpdateNoteEvent(
                        title: state.titleController.text.trim(),
                        text: state.textController.text.trim(),
                        index: index,
                      ),
                    );
                    Navigator.pop(context);
                    state.titleController.clear();
                    state.textController.clear();
                  }
                },
                child: const Text('Сохранить', style: AppStyle.buttonStyle),
              ),
            ],
          );
        }
      },
    );
  }
}
