import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//theme
import 'package:agenda/core/theme/app_color.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String icon;
  final bool selected;

  const DrawerListTile({
    required this.icon,
    required this.selected,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      height: 40,
      decoration: BoxDecoration(
        color: selected
            ? AppColor.instance.primary
            : AppColor.instance.secondaryBackground,
        border: Border.all(
          width: 2,
          color: selected
              ? AppColor.instance.primary
              : AppColor.instance.secondaryBackground,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        selected: selected,
        onTap: onTap,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          'asset/icones/Icon/$icon.svg',
          color: selected
              ? AppColor.instance.primaryBackground
              : AppColor.instance.secondary,
          width: 20,
          height: 20,
        ),
        dense: true,
        visualDensity: const VisualDensity(vertical: -3),
        title: Text(
          text,
          style: TextStyle(
            color: selected
                ? AppColor.instance.primaryBackground
                : AppColor.instance.secondary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
