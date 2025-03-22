import 'package:agenda/modules/widgets/circular_progress_custo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:agenda/modules/professional/presenter/home/controller/professional_controller.dart';

//widgets
import '../widget/data_table_professional.dart';
import '../../../../widgets/data_empity.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../widget/button_newprofessional.dart';

class ProfissionaisHome extends StatefulWidget {
  const ProfissionaisHome({Key? key}) : super(key: key);

  @override
  State<ProfissionaisHome> createState() => _ProfissionaisPageState();
}

class _ProfissionaisPageState extends State<ProfissionaisHome> {
  final ProfessionalController controler =
      Modular.get<ProfessionalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const CustomAppBar(texto: 'Profissionais'),
                      const ButtonNewProfessional(),
                      Observer(builder: (_) {
                        if (controler.loading) {
                          return  const SizedBox(
                            width: 500.0,
                            height: 300.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CenteredCircularProgress(),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else if (controler.repositories.isEmpty) {
                          return const EmpityData(
                            text: 'Adcione os seus primeiros profissional',
                          );
                        } else {
                          return DataTableProfessional(
                            listProfessional: controler.repositories,
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}