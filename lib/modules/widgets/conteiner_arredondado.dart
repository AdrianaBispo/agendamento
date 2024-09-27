import 'package:flutter/material.dart';
import 'package:agenda/core/utils/app_color.dart';

class ContainerArredondado extends StatelessWidget {
  final Widget child;
  final int widthDivider;
  const ContainerArredondado({Key? key, required this.child, this.widthDivider = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / widthDivider,
      decoration: BoxDecoration(
        color: AppColor.instance.primaryBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: child,
    );
  }
}
