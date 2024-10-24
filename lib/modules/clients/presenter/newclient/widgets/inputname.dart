import 'package:agenda/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import 'package:agenda/modules/clients/newclient/controller/newclient_controller.dart';
//component
import '../../../professional/presenter/widgets/input_custom.dart';

class InputName extends StatefulWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
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
          onChanged: (value) => controller.name = value,
          controller: _textController,
        ),
      ),
    );
  }
}
