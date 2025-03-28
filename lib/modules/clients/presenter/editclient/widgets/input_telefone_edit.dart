import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../widgets/input_custom.dart';
import '../controller/edit_client_controller.dart';

class InputTelefoneEdit extends StatefulWidget {
  const InputTelefoneEdit({Key? key}) : super(key: key);

  @override
  State<InputTelefoneEdit> createState() => _InputTelefoneEditState();
}

class _InputTelefoneEditState extends State<InputTelefoneEdit> {
  final _textController = TextEditingController();

  late ClientEditController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<ClientEditController>();
    controller.initialState();
  }

  @override
  void dispose() {
    controller.error.telephone = null;
    _textController.text = controller.telephone;
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
          onSaved: (value) => controller.telephone = value!,
          controller: _textController,
        ),
      ),
    );
  }
}
