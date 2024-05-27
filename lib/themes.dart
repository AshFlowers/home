import 'package:flutter/material.dart';

class AppColors {
  static final Color primary = Color(0xFF559595);
  static final Color lightBackground = Colors.white;
  static final Color lightText = Colors.black;
  static final Color darkBackground = Color(0xFF646464);
  static final Color darkText = Colors.grey.shade300;
}

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
  ),

  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.lightBackground,
  highlightColor: Colors.white,

  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.lightText,
      fontSize: 28.0,
      letterSpacing: 2.0,
    ),

    titleMedium: TextStyle(
      color: AppColors.lightText,
      fontSize: 14.0,
      letterSpacing: 1.0,
    ),

    titleSmall: TextStyle(
      color: AppColors.lightText,
      fontSize: 14.0,
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold,
    ),

    bodySmall: TextStyle(
      color: AppColors.lightText,
      fontSize: 14.0,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.5,
    ),

    bodyMedium: TextStyle(
      color: AppColors.lightText,
      fontSize: 14.0,
      letterSpacing: 0.5,
    ),

    bodyLarge: TextStyle(
      color: AppColors.lightText,
      fontSize: 14.0,
      letterSpacing: 0.5,
    ),
  ),

  iconTheme: IconThemeData(
    color: AppColors.primary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
    )
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.primary,
        ),
      ),
  ),
);


ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
  ),

  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  highlightColor: Colors.white,

  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.darkText,
      fontSize: 28.0,
      letterSpacing: 2.0,
    ),

    titleMedium: TextStyle(
      color: AppColors.darkText,
      fontSize: 14.0,
      letterSpacing: 1.0,
    ),

    titleSmall: TextStyle(
      color: AppColors.darkText,
      fontSize: 14.0,
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold,
    ),

    bodySmall: TextStyle(
      color: AppColors.darkText,
      fontSize: 14.0,
      fontStyle: FontStyle.italic,
      letterSpacing: 0.5,
    ),

    bodyMedium: TextStyle(
      color: AppColors.darkText,
      fontSize: 14.0,
      letterSpacing: 0.5,
    ),

    bodyLarge: TextStyle(
      color: AppColors.darkText,
      fontSize: 14.0,
      letterSpacing: 0.5,
    ),
  ),

  iconTheme: IconThemeData(
    color: AppColors.primary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      )
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: AppColors.primary,
      ),
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFA8A8A8),
  ),
);