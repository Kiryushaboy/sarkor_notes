import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/domain/model/note_model.dart';
import 'package:notes_app/ui/components/delete_alert_dialog.dart';
import 'package:notes_app/ui/components/note_appbar.dart';
import 'package:notes_app/ui/components/note_body.dart';
import 'package:notes_app/ui/style/app_colors.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.model, required this.index});

  final NoteModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width / 20),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NoteAppBar(index: index, model: model),
                NoteBody(model: model),
              ],
            ),
          ),
          floatingActionButton: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DeleteAlertDialog(index: index),
              );
            },
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(AppColors.buttonColor),
              elevation: MaterialStatePropertyAll(5),
            ),
            icon: const Icon(
              size: 35,
              Icons.delete_rounded,
              color: AppColors.textColor,
            ),
          ),
        );
      },
    );
  }
}
