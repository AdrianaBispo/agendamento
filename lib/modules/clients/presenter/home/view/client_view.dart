import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import '../controller/client_controller.dart';

//Widget
import '../../../../widgets/circular_progress_custo.dart';
import '../widgets/data_table_client.dart';
import '../widgets/button_newclient.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/data_empity.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  ClientController clientController = Modular.get<ClientController>();

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
                      const CustoAppBar(texto: 'Clientes'),
                      const ButtonNewClient(),
                      FutureBuilder<List<ClientDto>>(
                          future: clientController.getAll(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                            } else if (!snapshot.hasData &&
                                snapshot.data == null) {
                              return const EmpityData(
                                text: 'Adcione os seus primeiros clientes',
                              );
                            } else if (snapshot.data!.isEmpty) {
                              return const EmpityData(
                                text: 'Adcione os seus primeiros clientes',
                              );
                            } else {
                              return DataTableCliente(
                                  listClient: snapshot.data!);
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
