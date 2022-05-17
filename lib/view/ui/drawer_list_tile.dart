import 'package:flutter/material.dart';

import '../../const/colors.dart';

class DrawerListTile extends StatelessWidget {
  late String texto;
  late dynamic pagina;

  DrawerListTile({
    required this.pagina,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: ((context) => pagina)));
      },
      horizontalTitleGap: 0.0,
      title: Text(
        texto,
        style: const TextStyle(
          color: AppColor.natural,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
