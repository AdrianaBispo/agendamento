import 'package:flutter/material.dart';
//color
import '../../const/colors.dart';

class CustoAppBar extends StatelessWidget {
  String texto;
  CustoAppBar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: Text(
          texto,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.natural),
        ),
      ),
    );
  }
}
