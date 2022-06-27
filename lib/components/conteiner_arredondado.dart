import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
//components
import 'colors.dart';

class ContainerArredondado extends StatelessWidget {
  Widget child;
  int widthDivider;
  ContainerArredondado({required this.child, this.widthDivider = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / widthDivider,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: child,
    );
  }
}
