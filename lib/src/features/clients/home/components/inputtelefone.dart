import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:provider/provider.dart';
//controller
import '../store/clientehome_store.dart';

class InputTelefone extends StatefulWidget {
  const InputTelefone({Key? key}) : super(key: key);

  @override
  State<InputTelefone> createState() => InputTelefoneState();
}

class InputTelefoneState extends State<InputTelefone> {
  final _textController = TextEditingController();
  late final ClienteHomeController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<ClienteHomeController>();
    controller.initialState();
  }

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) => controller.telefone = value,
          controller: _textController,
        ),
      ),
    );
  }
}
