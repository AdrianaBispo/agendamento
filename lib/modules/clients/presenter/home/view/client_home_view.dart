import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controller/client_controller.dart';

//Widget
import '../../../../widgets/circular_progress_custo.dart';
import '../widgets/data_table_client.dart';
import '../widgets/button_newclient.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/data_empity.dart';

class ClientHomeView extends StatelessWidget {
  ClientHomeView({Key? key}) : super(key: key);

  final ClientController clientController = Modular.get<ClientController>();

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
                      const CustomAppBar(texto: 'Clientes'),
                      const ButtonNewClient(),
                      Observer(
                        builder: (_) {
                          if (clientController.loading) {
                            return const SizedBox(
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
                          } else if (clientController.repositories.isEmpty) {
                            return const EmpityData(
                              text: 'Adcione os seus primeiros clientes',
                            );
                          } else {
                            return DataTableCliente(
                              listClient: clientController.repositories,
                            );
                          }
                        },
                      ),
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
