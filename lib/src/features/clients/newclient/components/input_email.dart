import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';
//component
import '../../../components/input_custom.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({Key? key}) : super(key: key);

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
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
    controller.error.email = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => InputCustom(
        title: 'E-mail',
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'E-mail',
            errorText: controller.error.email,
          ),
          onChanged: (value) => controller.email = value,
          controller: _textController,
        ),
      ),
    );
  }
}
