import 'package:agenda/components/side_menu.dart';
import 'package:flutter/material.dart';
//model
import '../models/profissional.dart';
//components
import '../components/colors.dart';
import '../components/side_menu.dart';

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
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  color: AppColor.white,
                  child: SideMenu(
                    selected: const [false, false, false, false],
                  ) //sideMenu,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
