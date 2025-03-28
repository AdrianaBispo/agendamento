import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../widgets/input_custom.dart';
import '../controller/edit_client_controller.dart';
import 'package:agenda/core/theme/app_color.dart';

class InputNameEdit extends StatefulWidget {
  const InputNameEdit({Key? key}) : super(key: key);

  @override
  State<InputNameEdit> createState() => _InputNameEditState();
}

class _InputNameEditState extends State<InputNameEdit> {
  final _textController = TextEditingController();

  late ClientEditController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<ClientEditController>();
    _textController.text = controller.name;
    controller.initialState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller.error.name = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => InputCustom(
          title: 'Nome',
          child: TextFormField(
            cursorColor: AppColor.instance.primary,            
            decoration: InputDecoration(
              hintText: 'Nome',
              errorText: controller.error.name,
            ),
            onSaved: (value) => controller.name = value!,
            controller: _textController,
          ),
        ),
    );
  }
}
