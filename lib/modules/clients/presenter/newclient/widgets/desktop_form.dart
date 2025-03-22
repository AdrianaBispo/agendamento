import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'confirmbutton.dart';
import 'inputname.dart';
import 'inputtelefone.dart';

class DesktopForm extends StatelessWidget {
  const DesktopForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       const Row(
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
        Observer(
          builder: (context) {
            return const ConfirmButton();
          }
        ),
      ],
    );
  }
}
