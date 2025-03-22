import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
//controller
import '../controller/start_controller.dart';
//components
import 'drawer_list_tile.dart';

// ignore: must_be_immutable
class SideMenu extends StatelessWidget {
  final controller = Modular.get<StartController>();

  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: <Widget>[
          /*DrawerListTile(
          pagina: HomePage(),
          texto: 'Home',
          icon: 'element',
          selected: selected[0],
        ),
        DrawerListTile(
          pag: '',
          text: 'Agenda',
          icon: 'calendar',
          selected: selected[1],
        ),*/
          DrawerListTile(
            text: 'Clientes',
            icon: 'profile-2user',
            selected: controller.selected[2],
            onTap: () {
              controller.onTap(2);

              //lista[2]
            },
          ),
          DrawerListTile(
            text: 'Profissionais',
            icon: 'job',
            selected: controller.selected[3],
            onTap: () {
              controller.onTap(3);
            },
          ),
        ],
      );
    });
  }
}
