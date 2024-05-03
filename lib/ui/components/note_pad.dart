import 'package:flutter/material.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/components/delete_alert_dialog.dart';
import 'package:notes_app/ui/pages/edit_note_page.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class NotePad extends StatelessWidget {
  const NotePad({super.key, required this.model, required this.index});

  final NoteModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mq.height / 60),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width / 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNotePage(model: model, index: index),
              ),
            );
          },
          child: Container(
            height: mq.height / 6.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.noteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.5, 0.5),
                  blurRadius: 5,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: mq.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: mq.width / 1.5,
                        child: Text(
                          model.title ?? "Ошибка загрузки...",
                          style: AppStyle.noteTextStyle.copyWith(fontSize: 21),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DeleteAlertDialog(index: index),
                        ),
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: mq.width / 1.3,
                    child: Text(
                      model.text ?? "Ошибка загрузки...",
                      style: AppStyle.noteTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
