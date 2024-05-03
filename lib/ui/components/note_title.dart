import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({super.key, required this.model});

  final NoteModel? model;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        state.titleController.clear();
        if (state is AddNotePageState) {
          return SizedBox(
            width: mq.width,
            child: TextField(
              controller: state.titleController,
              style: AppStyle.editTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Введите заголовок...',
                hintStyle: TextStyle(
                  color: AppColors.noteColor.withOpacity(0.5),
                ),
              ),
              cursorColor: AppColors.buttonColor,
              maxLines: 2,
            ),
          );
        } else {
          return SizedBox(
            width: mq.width,
            child: TextField(
              controller: state.titleController = TextEditingController(
                text: model?.title,
              ),
              style: AppStyle.editTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Введите заголовок...',
                hintStyle:
                    TextStyle(color: AppColors.noteColor.withOpacity(0.5)),
              ),
              cursorColor: AppColors.buttonColor,
              maxLines: 2,
            ),
          );
        }
      },
    );
  }
}
