import 'package:flutter/material.dart';
//model
import '../models/cliente.dart';
import '../models/historico.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart'; //database
//routes
import '../utils/routes.dart';
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
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _custoAppBar(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    Widget _custoAppBar() {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.white,
              ),
              onPressed: () => {
                Navigator.pushReplacementNamed(context, AppRoutes.CLIENTES),
              },
            ),
          ),
          CustoAppBar(
            texto: 'Editar',
          ),
        ],
      ),
    ); //Custo AppBar
  }

}
