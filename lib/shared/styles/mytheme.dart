import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Primarycolor,
    scaffoldBackgroundColor: BackGcolor,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Primarycolor,
        onPrimary: Whitecolor,
        secondary: Greencolor,
        onSecondary: Whitecolor,
        error: err,
        onError: Whitecolor,
        background: BackGcolor,
        onBackground: Blackcolor,
        surface: Colors.grey,
        onSurface: Blackcolor),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Whitecolor),
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Whitecolor,
      selectedItemColor: Primarycolor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Whitecolor),
        subtitle1: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Primarycolor),
        subtitle2: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: Greencolor),
      bodyText1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Blackcolor),
    ),
  );

  static ThemeData darktheme = ThemeData(
    primaryColor: Primarycolor,
    scaffoldBackgroundColor: BackGdarkcolor,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Primarycolor,
        onPrimary: Whitecolor,
        secondary: Greencolor,
        onSecondary: Whitecolor,
        error: err,
        onError: Whitecolor,
        background: BackGdarkcolor,
        onBackground: Blackcolor,
        surface: Colors.grey,
        onSurface: Blackcolor),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Blackcolor),
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(20, 25, 34, 1.0),
      selectedItemColor: Primarycolor,
      unselectedItemColor: Whitecolor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Blackcolor),
      subtitle1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Primarycolor),
      subtitle2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: Greencolor),
      bodyText1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Whitecolor),
    ),
  );
}
