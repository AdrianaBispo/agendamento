import 'package:flutter/material.dart';
//utils
import 'app_color.dart';
import 'app_textstyle.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Montserrat',
      primaryColor: AppColor.instance.primary,
      dividerColor: AppColor.instance.accent3,
      scaffoldBackgroundColor: AppColor.instance.primaryBackground,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColor.instance.primaryText,
          fontSize: 13,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColor.instance.primaryText,
          fontSize: 14,
        ),
        hintStyle: AppTextStyle.instance.hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 8.0,
        ),
        isDense: true,
        fillColor: AppColor.instance.secondaryBackground,
        focusColor: AppColor.instance.secondaryBackground,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.instance.accent2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColor.instance.accent2,
          ),
        ),
      ),
    );
  }
}
