import 'package:flutter/material.dart';
//color
import '../../const/colors.dart';
//ui
import 'package:agenda/view/ui/drawer_list_tile.dart';
//view
import '../home_page.dart';
import '../clientes_page.dart';

class SideMenu extends StatelessWidget {
  List<bool> selected;
  SideMenu({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerListTile(
          pagina: HomePage(),
          texto: 'Home',
          icon: 'element',
          selected: selected[0],
        ),
        DrawerListTile(
          pagina: {},
          texto: 'Agenda',
          icon: 'calendar',
          selected: selected[1],
        ),
        DrawerListTile(
          pagina: ClientesPage(),
          texto: 'Clientes',
          icon: 'profile-2user',
          selected: selected[2],
        ),
        DrawerListTile(
          pagina: {},
          texto: 'Profissionais',
          icon: 'job',
          selected: selected[3],
        ),
      ],
    );
  }
}
