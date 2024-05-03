import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/components/note_text.dart';
import 'package:notes_app/ui/components/note_title.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key, this.model});

  final NoteModel? model;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SizedBox(
      width: mq.width,
      height: mq.height,
      child: Column(
        children: [
          SizedBox(height: mq.height / 40),
          NoteTitle(model: model),
          SizedBox(height: mq.height / 40),
          NoteText(model: model),
          SizedBox(height: mq.height / 12),
        ],
      ),
    );
  }
}
