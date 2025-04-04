import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class Apptheme {
  static  _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(color:color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
    ),
  );
}
