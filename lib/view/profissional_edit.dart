import 'package:agenda/components/side_menu.dart';
import 'package:flutter/material.dart';
//model
import '../models/profissional.dart';
//components
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';

class ProfissionalEdit extends StatefulWidget {
  Profissional profissional;
  ProfissionalEdit({required this.profissional});

  @override
  State<ProfissionalEdit> createState() => _ProfissionalEditState();
}

class _ProfissionalEditState extends State<ProfissionalEdit> {
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
                child: SingleChildScrollView(
                  primary: false,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      //alinhar verticalmento no top e horizontalmente no centro
                      children: [
                        _custoAppBar(),
                        _formContainer(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2,
      height: 70,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  } //form Container

  Widget _custoAppBar() {
    return Align (
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
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
              onPressed: () => {Navigator.pop(context),
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
