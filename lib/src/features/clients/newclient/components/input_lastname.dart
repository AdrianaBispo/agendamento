import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';

class InputLastName extends StatefulWidget {
  const InputLastName({Key? key}) : super(key: key);

  @override
  State<InputLastName> createState() => _InputLastNameState();
}

class _InputLastNameState extends State<InputLastName> {
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
    controller.error.lastname = null;
    super.dispose();
  }

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
            labelText: 'Sobrenome',
            errorText: controller.error.lastname,
          ),
          onChanged: (value) => controller.lastname = value,
          controller: _textController,
        ),
      ),
    );
  }
}
