import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';
//component
import '../../../components/input_custom.dart';
//utils
import '../../../../shared/utils/app_color.dart';

class InputTelefone extends StatefulWidget {
  const InputTelefone({Key? key}) : super(key: key);

  @override
  State<InputTelefone> createState() => _InputTelefoneState();
}

class _InputTelefoneState extends State<InputTelefone> {
  final _textController = TextEditingController();

  late NewClientController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<NewClientController>();
    controller.initialState();
  }

  @override
  void dispose() {
    controller.error.dateBirth = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => InputCustom(
        title: 'Celular',
        child: TextFormField(
          cursorColor: AppColor.instance.primary,
          decoration: InputDecoration(
            hintText: 'Número de Celular',
            errorText: controller.error.telephone,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ],
          onChanged: (value) => controller.telephone = value,
          controller: _textController,
        ),
      ),
    );
  }
}
