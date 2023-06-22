import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
//controller
import '../controller/newclient_controller.dart';

class InputLastName extends StatelessWidget {
  InputLastName({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  late final NewClientController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.read<NewClientController>();
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Sobrenome',
            errorText: controller.error.name,
          ),
          onChanged: (value) => controller.lastname = value,
          controller: _textController,
        ),
      ),
    );
  }
}
