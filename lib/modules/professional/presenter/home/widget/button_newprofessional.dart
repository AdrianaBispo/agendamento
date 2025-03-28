import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agenda/core/theme/app_color.dart';

class ButtonNewProfessional extends StatelessWidget {
  const ButtonNewProfessional({Key? key}) : super(key: key);

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
          label: FittedBox(
            child: Text(
              'Novo Professional',
              style: TextStyle(
                color: AppColor.instance.secondaryBackground,
              ),
            ),
          ),
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 50),
            maximumSize: const Size(200, 60),
            backgroundColor: AppColor.instance.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onPressed: () => Modular.to.navigate(''),
        ),
      ),
    );
  }
}
