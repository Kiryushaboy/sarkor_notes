import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    return AlertDialog(
      title: Text(
        'Удаление заметки',
        style: AppStyle.noteTextStyle.copyWith(fontSize: 22),
      ),
      content: const Text(
        'Вы уверены что хотите удалить заметку?',
        style: AppStyle.noteTextStyle,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Нет', style: AppStyle.buttonStyle),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  noteBloc.add(DeleteNoteEvent(index));
                  Navigator.pop(context);
                  if (Navigator.canPop(context)) {
                    return Navigator.pop(context);
                  }
                },
                child: const Text('Да', style: AppStyle.buttonStyle),
              ),
            ),
          ],
        ),
      ],
      elevation: 10,
      shadowColor: Colors.black,
      backgroundColor: AppColors.noteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
