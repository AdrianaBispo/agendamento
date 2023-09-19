import 'package:flutter/material.dart';
//utils
import 'app_color.dart';

class AppTextStyle {
  static AppTextStyle? _instance;
  AppTextStyle._();

  static AppTextStyle get instance {
    _instance ??= AppTextStyle._();
    return _instance!;
  }

  

  TextStyle hintText = TextStyle(
    color: AppColor.instance.secondaryText,
    fontSize: 13,
  );
}
