import 'package:flutter/material.dart';
//color
import '../const/colors.dart';
//ui
import 'ui/side_menu.dart';
import 'ui/custom_appBar.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1, //takes 1/6 of the screen
                child: SideMenu(selected: [false, false, true, false]),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    children: [
                      CustoAppBar(texto: 'Clientes'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
