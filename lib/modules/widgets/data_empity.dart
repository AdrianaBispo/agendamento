import 'package:flutter/material.dart';

import '../../core/theme/app_textstyle.dart';

class EmpityData extends StatelessWidget {
  final String text;
  const EmpityData({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: AppTextStyle.instance.withoutData,
              ),
            ),
          )
        ],
      ),
    );
  }
}
