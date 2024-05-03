import 'package:flutter/material.dart';
import 'package:notes_app/ui/components/note_appbar.dart';
import 'package:notes_app/ui/components/note_body.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width / 20),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            NoteAppBar(),
            NoteBody(),
          ],
        ),
      ),
    );
  }
}
