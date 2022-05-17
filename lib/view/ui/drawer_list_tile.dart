import 'package:flutter/material.dart';
//ui
import '../../const/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatelessWidget {
  late String texto;
  late dynamic pagina;
  late String icon;

  DrawerListTile({
    required this.pagina,
    required this.texto,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: ((context) => pagina)));
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset('asset/icones/Icon/$icon.png'),
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
