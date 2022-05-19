import 'package:flutter/material.dart';
//ui
import '../../const/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatelessWidget {
  late String texto;
  late dynamic pagina;
  late String icon;
  bool selected;

  DrawerListTile({
    required this.pagina,
    required this.texto,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: selected ? AppColor.blue : AppColor.white,
        border: Border.all(
          width: 2,
          color: selected ? AppColor.blue : AppColor.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        selected: selected,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: ((context) => pagina)),
          );
        },
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          'asset/icones/Icon/$icon.svg',
          color: selected ? AppColor.white : AppColor.natural_5,
          width: 20,
          height: 20,
        ),
        title: Text(
          texto,
          style: TextStyle(
            color: selected ? AppColor.white : AppColor.natural_5,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
