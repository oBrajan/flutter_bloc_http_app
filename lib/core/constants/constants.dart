import 'package:flutter/material.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

class Constants {
  static const String E2K_API_URL = '';

  static const String AUTH0_CLIENT_ID = '';
  static const String AUTH0_DOMAIN = '';

  static String accessToken;

  static Map<String, String> header = {
    'Authorization': 'Bearer ${Constants.accessToken}'
  };
}

class AppColors {
  // Light theme
  static const Color primary_color_light = Color.fromRGBO(75, 75, 75, 1);
  static const Color accent_color_light = Color.fromRGBO(40, 97, 235, 1);
  static const Color background_grey = Color.fromRGBO(239, 239, 243, 1);

  // Dark theme
  static Color primaryColorDark = Colors.grey[900];
  static const Color accent_color_dark = Colors.deepPurpleAccent;

  static const Color projects_color_light = Color.fromRGBO(150, 150, 255, 1);
  static const Color projects_color = Color.fromRGBO(93, 56, 226, 1);
  static const Color topics_color = Color.fromRGBO(241, 155, 119, 1);
  static const Color queries_color = Color.fromRGBO(249, 183, 5, 1);
  static const Color posts_color = Color.fromRGBO(82, 206, 212, 1);
  static const Color card_background_grey = Color.fromRGBO(175, 175, 187, 1);
}
