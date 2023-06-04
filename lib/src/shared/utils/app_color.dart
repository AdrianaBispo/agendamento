import 'package:flutter/material.dart'
;
class AppColor{
  static AppColor? _instance;
  AppColor._();

  static AppColor get instance {
    _instance ??=AppColor._();
    return _instance!;
  }

  Color get blue => const Color(0xff377DFF);
  Color get blueSecondary => const Color(0xff56CCF2);
  Color get blueTerciary => const Color(0xff9AE0F7);
  Color get blueFourt => const Color(0xffD7F5E7);
  Color get grenn => const Color(0xff38CB89);
  Color get red => const Color(0xffFF5630);
  Color get white => const Color(0xffFFFFFF);
  Color get black => const Color(0xff1A1D1F);
  Color get natural => const Color(0xff333333);
  Color get natural_2 => const Color(0xff8F8F8F);
  Color get natural_3 => const Color(0xffB2B2B2);
  Color get natural_5 => const Color(0xffC4C4C4); //icones disable
  Color get natural_7 => const Color(0xffEFEFEF);
  Color get stronk => const Color(0xffF0F0F0);

}