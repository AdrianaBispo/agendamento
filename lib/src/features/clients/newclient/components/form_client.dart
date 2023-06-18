import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
//controller
import '../../home/store/clientehome_store.dart';
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
  late final ClienteHomeController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<ClienteHomeController>();
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
        child: Column(
          children: <Widget>[
            InputName(),
            InputTelefone(),
            ConfirmButton(),
            
          ],
        ),
      ),
    );
  }
}
