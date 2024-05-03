import 'package:flutter/material.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Ошибка сохранения!',
        style: AppStyle.noteTextStyle.copyWith(fontSize: 22),
      ),
      content: const Text(
        'Поле заголовка и поле текста обязательны для заполнения.',
        style: AppStyle.noteTextStyle,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Хорошо', style: AppStyle.buttonStyle),
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
