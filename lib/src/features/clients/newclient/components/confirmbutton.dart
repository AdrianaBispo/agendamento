import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

//utils
import '../../../../shared/utils/app_color.dart';
import '../../home/store/clientehome_store.dart';


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ClienteHomeController>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton.icon(
        icon: SvgPicture.asset(
          'asset/icones/Icon/add.svg',
          color: AppColor.instance.white,
          width: 20,
          height: 20,
        ),
        label: Text(
          'Salvar',
          style: TextStyle(
            color: AppColor.instance.white,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
          backgroundColor: AppColor.instance.grenn,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: () {
          Dialog(){

          }
          /*controller.validateAll();
          if (controller.error.hasErrors != false) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Novo usuário salvo com sucesso ')),
            );
          }*/
        }, //onPressed
      ),
    );
  }
}
