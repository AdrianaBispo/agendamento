import 'package:agenda/core/utils/app_color.dart';
import 'package:agenda/modules/clients/newclient/controller/newclient_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
//utils


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<NewClientController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton.icon(
        icon: SvgPicture.asset(
          'asset/icones/Icon/add.svg',
          color: AppColor.instance.secondaryBackground,
          width: 20,
          height: 20,
        ),
        label: Text(
          'Salvar',
          style: TextStyle(
            color: AppColor.instance.secondaryBackground,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
          minimumSize: const Size(350, 60),
          backgroundColor: AppColor.instance.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: () {
          controller.validateAll();
          if (controller.error.hasErrors == false) {
            
           Modular.to.navigate('./');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Novo usuário salvo com sucesso ')),
            );
          }
        }, //onPressed
      ),
    );
  }
}
