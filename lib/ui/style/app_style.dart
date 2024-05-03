import 'package:flutter/material.dart';
import 'package:notes_app/ui/style/app_colors.dart';

abstract class AppStyle {
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 22,
    color: AppColors.buttonColor,
  );
  static const TextStyle editTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.orange,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle noteTextStyle = TextStyle(
    fontSize: 18,
    color: AppColors.textColor,
  );
}
