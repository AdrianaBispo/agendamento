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

  TextStyle withoutData = TextStyle(
    color: AppColor.instance.primaryText,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  TextStyle hintText = TextStyle(
    color: AppColor.instance.secondaryText,
    fontSize: 13,
  );

  TextStyle dataColumn = TextStyle(
    color: AppColor.instance.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  TextStyle dataCell = TextStyle(
    color: AppColor.instance.primaryText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
