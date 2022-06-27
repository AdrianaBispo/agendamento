import 'package:flutter/material.dart';
//model
import '../models/cliente.dart';
import '../models/historico.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart'; //database
//components
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_picker/flutter_picker.dart';

class ClienteEdit extends StatefulWidget {
  Cliente cliente;
  ClienteEdit({required this.cliente});

  @override
  State<ClienteEdit> createState() => _ClienteEditState();
}

class _ClienteEditState extends State<ClienteEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColor.white,
                child: SideMenu(
                  selected: const [false, false, false, false],
                ), //sideMenu
              ),
            )
          ],
        ),
      ),
    );
  }
}
