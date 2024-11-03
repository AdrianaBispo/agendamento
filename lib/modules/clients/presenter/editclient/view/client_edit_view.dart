import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../data/dtos/client_dto.dart';
import '../widgets/client_data.dart';
import '../widgets/data_table_historic.dart';

class ClienteEditView extends StatefulWidget {
  final ClientDto cliente;
  const ClienteEditView({
    Key? key,
    required this.cliente,
  }) : super(key: key);

  @override
  State<ClienteEditView> createState() => _ClienteEditViewState();
}

class _ClienteEditViewState extends State<ClienteEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const CustomAppBar(texto: 'Editar'),
                        const ClientData(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.instance.secondaryBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: DataTableHistoric(
                              listHistoric: widget.cliente.historicClient,
                            ),
                          ),
                        ),
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
}
