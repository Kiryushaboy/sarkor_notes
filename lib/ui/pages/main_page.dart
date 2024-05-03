import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/bloc/notes_bloc.dart';
import 'package:notes_app/ui/pages/add_note_page.dart';
import 'package:notes_app/ui/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is HomePageState) {
          return const HomePage();
        }
        if (state is AddNotePageState) {
          return const AddNotePage();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
