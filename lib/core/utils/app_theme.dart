import 'package:flutter/material.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData defaultTheme(context) => ThemeData(
        focusColor: Colors.black,
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white70),
      );
}
