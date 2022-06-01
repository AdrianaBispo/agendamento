import 'package:flutter/material.dart';
//color
import 'colors.dart';

class CustoAppBar extends StatelessWidget {
  String texto;
  CustoAppBar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0), //aumentar o padding
        child: Text(
          texto,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20, //talvez diminuir um pouco a font
              color: AppColor.natural),
        ),
      ),
    );
  }
}
