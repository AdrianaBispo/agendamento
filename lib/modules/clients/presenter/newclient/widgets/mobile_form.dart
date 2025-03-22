import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'confirmbutton.dart';
import 'inputname.dart';
import 'inputtelefone.dart';

class MobileForm extends StatelessWidget {
  const MobileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputName(),
        const SizedBox(width: 20),
        const InputTelefone(),
        Observer(builder: (context) {
          return const ConfirmButton();
        }),
      ],
    );
  }
}
