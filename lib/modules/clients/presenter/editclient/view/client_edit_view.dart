import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../data/dtos/client_dto.dart';
import '../controller/edit_client_controller.dart';
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
  ClientEditController clientController = Modular.get<ClientEditController>();

  @override
  void initState() {
    super.initState();
    clientController.clientDto = widget.cliente;
  }

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
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, top: 20),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColor.instance.primary,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColor.instance.secondaryBackground,
                                ),
                                onPressed: () => Modular.to.pop(),
                              ),
                            ),
                            const CustomAppBar(texto: 'Editar'),
                          ],
                        ),
                        const ClientData(),
                        Text(widget.cliente.nameClient),
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
