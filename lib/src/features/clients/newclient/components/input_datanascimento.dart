import 'package:agenda/src/features/components/input_custom.dart';
import 'package:agenda/src/shared/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';

class InputDataNascimento extends StatefulWidget {
  const InputDataNascimento({Key? key}) : super(key: key);

  @override
  State<InputDataNascimento> createState() => _InputDataNascimentoState();
}

class _InputDataNascimentoState extends State<InputDataNascimento> {
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
        title: 'Data de Nascimento',
        child: TextFormField(
          cursorColor: AppColor.instance.primary,
          decoration: InputDecoration(
            hintText: 'Data',
            errorText: controller.error.dateBirth,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DataInputFormatter(),
          ],
          onChanged: (value) => controller.dateBirth = value,
          controller: _textController,
        ),
      ),
    );
  }
}
