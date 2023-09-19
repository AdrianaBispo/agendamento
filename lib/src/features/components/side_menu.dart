import 'package:flutter/material.dart';
//components
import 'drawer_list_tile.dart';

class SideMenu extends StatelessWidget {
  List<bool> selected;
  SideMenu({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          pag: '/clients/',
          text: 'Clientes',
          icon: 'profile-2user',
          selected: selected[2],
        ),
        /*DrawerListTile(
          pagina: ProfissionaisPage(),
          texto: 'Profissionais',
          icon: 'job',
          selected: selected[3],
        ),*/
      ],
    );
  }
}
