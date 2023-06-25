import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';

class InputTelefone extends StatelessWidget {
  InputTelefone({Key? key}) : super(key: key);

  final _textController = TextEditingController();
  late final NewClientController controller;

  @override
  Widget build(BuildContext context) {
    controller = Modular.get<NewClientController>();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Número de celular',
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
