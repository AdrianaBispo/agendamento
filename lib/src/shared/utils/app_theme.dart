import 'package:flutter/material.dart';
//utils
import 'app_color.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: AppColor.instance.blue, 
      dividerColor: AppColor.instance.natural_7,
      scaffoldBackgroundColor: AppColor.instance.stronk,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColor.instance.black,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        isDense: true,
        fillColor: AppColor.instance.white,
        focusColor: AppColor.instance.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.instance.natural_5,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColor.instance.natural_5,
          ),
        ),
      ),
    );
  }
}
