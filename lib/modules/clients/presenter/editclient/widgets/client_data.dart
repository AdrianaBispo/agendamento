import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientData extends StatefulWidget {
  const ClientData({Key? key}) : super(key: key);

  @override
  State<ClientData> createState() => _ClientDataState();
}

class _ClientDataState extends State<ClientData> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const InputNameEdit(),
            const InputTelefoneEdit(),
            SizedBox(width: 20),
            const ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
