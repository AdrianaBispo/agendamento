import 'package:flutter/material.dart';
//color
import '../../shared/utils/app_color.dart';

class CustoAppBar extends StatelessWidget {
  final String texto;
  const CustoAppBar({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0),
        child: Text(
          texto,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.instance.natural),
        ),
      ),
    );
  }
}
