import 'package:flutter/material.dart';
import 'package:home_islami/app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryDark)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
      ));
}
