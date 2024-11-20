import 'package:flutter/material.dart';

import 'confirmbutton.dart';
import 'inputname.dart';
import 'inputtelefone.dart';

class MobileForm extends StatelessWidget {
  const MobileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputName(),
        SizedBox(width: 20),
        InputTelefone(),
        ConfirmButton(),
      ],
    );
  }
}
