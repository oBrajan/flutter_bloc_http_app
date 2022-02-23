import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  Normal,
  Dark,
}

final appThemeData = {
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    accentColor: AppColors.accent_color_dark,
  ),
  AppTheme.Normal: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary_color_light,
    accentColor: AppColors.accent_color_light,
  ),
};
