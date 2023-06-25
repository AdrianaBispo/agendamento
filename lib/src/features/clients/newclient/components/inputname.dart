import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';

class InputName extends StatelessWidget {
  InputName({Key? key}) : super(key: key);

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
            labelText: 'Nome',
            errorText: controller.error.name,
          ),
          onChanged: (value) => controller.name = value,
          controller: _textController,
        ),
      ),
    );
  }
}
