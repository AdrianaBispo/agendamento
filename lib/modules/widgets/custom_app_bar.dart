import 'package:flutter/material.dart';
import 'package:agenda/core/utils/app_textstyle.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  const CustomAppBar({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0),
        child: Text(
          texto,
          textAlign: TextAlign.left,
          style: AppTextStyle.instance.appBar,
        ),
      ),
    );
  }
}
