import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      textTheme: TextTheme(headlineSmall: TextStyle(color: Colors.white)),
      scaffoldBackgroundColor: Colors.white, //0xFF5E5E5E5
      appBarTheme: AppBarTheme(
          color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
      primaryColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextTheme().labelLarge,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red))),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
      ),
    );
  }
}
