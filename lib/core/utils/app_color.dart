import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  AppColor._();

  static AppColor get instance {
    _instance ??= AppColor._();
    return _instance!;
  }

  Color get primary => const Color(0xff1b998b);
  Color get secondary => const Color(0xff60695c);
  Color get terciary => const Color(0xffef767a);
  Color get alternative => const Color(0xff6daba2);
  Color get primaryText => const Color(0xff101213);
  Color get secondaryText => const Color(0xff9d9d9d);
  Color get primaryBackground => const Color(0xffecf1ef);
  Color get secondaryBackground => const Color(0xffFFFFFF);

  Color get accent1 => const Color(0xffD0E0DE);
  Color get accent2 => const Color(0xffE0E0E0);
  Color get accent3 => const Color(0xffE0E0E0);
  Color get accent4 => const Color(0xffEEEEEE);

  Color get sucess => const Color(0xff04a24c);
  Color get error => const Color(0xffe21c3d);

  Color get warning => const Color(0xffFCDC0C);
  Color get info => const Color(0xff1c4494);
}
