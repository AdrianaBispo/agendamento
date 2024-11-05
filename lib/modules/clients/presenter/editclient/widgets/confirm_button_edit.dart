import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controller/edit_client_controller.dart';
import 'package:agenda/core/theme/app_color.dart';


class ConfirmButtonEdit extends StatelessWidget {
  const ConfirmButtonEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ClientEditController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton(
        child: Text(
          'Editar cliente',
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
            //controller.update();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cliente editado com sucesso!')),
            );
          }
        }, 
      ),
    );
  }
}
