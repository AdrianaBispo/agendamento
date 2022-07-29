import 'package:flutter/material.dart';
//components
import '../components/colors.dart';

InputDecoration inputdecoration(String labelText) => InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColor.black, fontSize: 14),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      isDense: true,
      fillColor: AppColor.white,
      focusColor: AppColor.white,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColor.natural_5),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: AppColor.natural_5),
      ),
    );
