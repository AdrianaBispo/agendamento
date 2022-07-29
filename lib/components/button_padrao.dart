import 'package:flutter/material.dart';
//components
import 'colors.dart';

class ButtonPadrao extends StatelessWidget {
  String texto;
  void Function()? onPressed;
  Color color;
  ButtonPadrao(
      {required this.texto, required this.color, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton(
        child: Text(
          texto,
          style: const TextStyle(
            color: AppColor.white,
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
