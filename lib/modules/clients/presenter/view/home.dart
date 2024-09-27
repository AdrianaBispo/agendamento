import 'package:agenda/core/utils/app_textstyle.dart';
import 'package:agenda/modules/clients/presenter/controller/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

//Widget
import 'package:agenda/modules/clients/presenter/widgets/data_table_client.dart';
import 'package:agenda/modules/widgets/circular_progress_custo.dart';
import 'package:agenda/src/features/components/button_new.dart';
import 'package:agenda/src/features/components/custom_appbar.dart';



class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  ClientController clientController =
      Modular.get<ClientController>();

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
                      const ButtonNew(
                        path: '/clients/newclient',
                        text: 'Novo Cliente',
                      ),
                      FutureBuilder<List<ClientDto>>(
                          future: clientController.getAll(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
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
                              return textDataEmpity();
                            } else if (snapshot.data!.isEmpty) {
                              return textDataEmpity();
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

  SizedBox textDataEmpity() {
    return SizedBox(
      width: 500.0,
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text('Adcione os seus primeiros clientes',
                  style: AppTextStyle.instance.withoutData),
            ),
          )
        ],
      ),
    );
  }
}
