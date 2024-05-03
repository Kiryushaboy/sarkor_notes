import 'package:flutter/material.dart';
import 'package:notes_app/ui/components/floating_btn.dart';
import 'package:notes_app/ui/components/main_body.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.noteColor,
        surfaceTintColor: AppColors.noteColor,
        shadowColor: Colors.grey,
        title: Text(
          'Sarkor Notes',
          style: AppStyle.noteTextStyle.copyWith(fontSize: 32),
        ),
      ),
      body: const MainBody(),
      floatingActionButton: const FloatingBtn(),
    );
  }
}
