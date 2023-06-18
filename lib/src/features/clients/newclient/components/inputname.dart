import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
//controller
import '../../home/store/clientehome_store.dart';

class InputName extends StatelessWidget {
  InputName({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  late final ClienteHomeController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.read<ClienteHomeController>();
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
          onChanged: (value) => controller.nome = value,
          controller: _textController,
        ),
      ),
    );
  }
}
