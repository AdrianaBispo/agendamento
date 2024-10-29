import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/newclient_controller.dart';
//component
import 'inputname.dart';
import 'inputtelefone.dart';
import 'confirmbutton.dart';

class FormClient extends StatefulWidget {
  const FormClient({Key? key}) : super(key: key);

  @override
  State<FormClient> createState() => _FormClientState();
}

class _FormClientState extends State<FormClient> {
  final _formKey = GlobalKey<FormState>();
  late final NewClientController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<NewClientController>();
    controller.initialState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      child: Form(
        key: _formKey,
        child: const Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: InputName(),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: InputTelefone(),
                ),
              ],
            ),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
