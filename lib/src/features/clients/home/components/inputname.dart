import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
//controller
import '../store/clientehome_store.dart';

class InputName extends StatefulWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  State<InputName> createState() => InputNameState();
}

class InputNameState extends State<InputName> {
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
      builder: (_) 
      => Padding(
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
