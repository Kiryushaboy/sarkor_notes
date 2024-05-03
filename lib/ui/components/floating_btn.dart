import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/ui/style/app_colors.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    return IconButton(
      onPressed: () => noteBloc.add(AddNotePageEvent()),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(AppColors.buttonColor),
      ),
      icon: const Icon(
        size: 35,
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
