import 'package:flutter/material.dart';
import '../../newclient/widgets/confirmbutton.dart';
import 'input_telefone_edit.dart';
import 'input_nome_edit.dart';

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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Form(
        key: _formKey,
        child: const Column(
          children: <Widget>[
            InputNameEdit(),
            InputTelefoneEdit(),
            SizedBox(width: 20),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
