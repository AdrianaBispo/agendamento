import 'package:flutter/material.dart';

import 'confirmbutton.dart';
import 'inputname.dart';
import 'inputtelefone.dart';

class DesktopForm extends StatelessWidget {
  const DesktopForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
