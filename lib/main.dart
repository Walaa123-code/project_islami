import 'package:flutter/material.dart';
import 'package:home_islami/Hadith/hadith_datails_screen.dart';
import 'package:home_islami/home_screen.dart';
import 'package:home_islami/Quran/my_theme_data.dart';
import 'package:home_islami/Quran/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
      },
    );
  }
}
