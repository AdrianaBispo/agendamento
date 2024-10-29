import 'package:flutter/material.dart';
//core
import 'package:agenda/core/utils/app_color.dart';

class ButtonPadrao extends StatelessWidget {
  final String texto;
  final void Function()? onPressed;
  final Color color;
  const ButtonPadrao(
      {Key? key,
      required this.texto,
      required this.color,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton(
        child: Text(
          texto,
          style: TextStyle(
            color: AppColor.instance.primaryBackground,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
