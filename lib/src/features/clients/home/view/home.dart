import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../cliente_hive/client_adapter.dart';
import '../../../../shared/models/cliente.dart';
//componentes
import '../../../components/button_new.dart';
import '../../../components/custom_appbar.dart';
import '../components/data_table_client.dart';
import '../../../components/circular_progress_custom.dart';
//utils
import '../../../../shared/utils/app_textstyle.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  Future<List<Cliente>> clienteHive =
      Modular.get<IClienteAdapter>().readAllRegisters();

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
                      FutureBuilder<List<Cliente>>(
                          future: clienteHive,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CenteredCircularProgress();
                            } else if (!snapshot.hasData &&
                                snapshot.data == null) {
                              return Text(
                                'Adcione os seus primeiros clientes',
                                style: AppTextStyle.instance.withoutData);
                            } else if (snapshot.data!.isEmpty) {
                              return Text(
                                'Adcione os seus primeiros clientes',
                                style: AppTextStyle.instance.withoutData);
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
