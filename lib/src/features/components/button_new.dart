import 'package:agenda/src/shared/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNew extends StatelessWidget {
  final String text;
  final String path;
  const ButtonNew({Key? key, required this.text, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: TextButton.icon(
          icon: SvgPicture.asset(
            'asset/icones/Icon/add.svg',
            color: AppColor.instance.secondaryBackground,
            width: 20,
            height: 20,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: AppColor.instance.secondaryBackground,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
            backgroundColor: AppColor.instance.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onPressed: () => Modular.to.navigate(path),
        ),
      ),
    );
  }
}
