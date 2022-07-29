import 'package:flutter/material.dart';
//color
import 'colors.dart';
//ui
import '../components/drawer_list_tile.dart';
//view
import '../view/home_page.dart';
import '../view/clientes_page.dart';
import '../view/profissionais_page.dart';
import '../view/agendamento_page.dart';
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
          pagina: AgendamentoPage(),
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
          pagina: ProfissionaisPage(),
          texto: 'Profissionais',
          icon: 'job',
          selected: selected[3],
        ),
      ],
    );
  }
}
