import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../data/dtos/client_dto.dart';
import '../widgets/client_data.dart';

//components

class ClienteEditView extends StatefulWidget {
  ClientDto cliente;
  ClienteEditView({required this.cliente});

  @override
  State<ClienteEditView> createState() => _ClienteEditViewState();
}

class _ClienteEditViewState extends State<ClienteEditView> {
  /*var clienteController = ClienteController();
  @override
  void initState() {
    super.initState();
    _nameEditController.text = widget.cliente.nome;
    _telefoneEditController.text = widget.cliente.telefone;
    _listaHistorico = widget.cliente.historico;
  }*/

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
                  children: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomAppBar(texto: 'Editar'),
                        ClientData(),
                        /*Container(
                          margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration:  BoxDecoration(
                            color: AppColor.instance.secondaryBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: _dataListaHistorico(),
                        ),*/
                        //_deletarCliente(),
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
/*
  Widget _dataListaHistorico() {
    if (widget.cliente.historico.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
          child: Text(
            'Esse cliente ainda não pediu nenhum serviço',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
          ),
        ),
      );
    }
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Profissional',
            style: TextStyle(
              color: AppColor.natural,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Serviço',
            style: TextStyle(
              color: AppColor.natural,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        DataColumn(
          label: Text(''),
        ), //editar
      ],
      rows: List.generate(
        _listaHistorico.length,
        (index) => _dataListaServicos(index, _listaHistorico[index]),
      ),
    );
  }

  DataRow _dataListaServicos(int index, Historico historico) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            historico.profissionalNome,
            style: const TextStyle(
              color: AppColor.natural,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        DataCell(
          Text(
            historico.servico,
            style: const TextStyle(
              color: AppColor.natural,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    //colocar em um showdialog
                    title: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Deletar historico',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: AppColor.natural),
                      ),
                    ),
                    content: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                      child: const Text(
                        'Você tem certeza que deseja deletar o historico desse serviço? ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: AppColor.natural),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Não',
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          backgroundColor: AppColor.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text(
                          'Sim',
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          backgroundColor: AppColor.grenn,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        onPressed: () {
                          setState(() => _listaHistorico.removeAt(index));
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }),
            //editar o nome e a profissão
            icon: const Icon(
              Icons.delete_sharp,
              color: AppColor.natural_2,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  _deletarCliente() {
    return ButtonPadrao(
      texto: 'Deletar Cliente',
      color: AppColor.red,
      onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Deletar cliente',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppColor.natural),
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                child: const Text(
                  'Você tem certeza que deseja deletar esse cliente?',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColor.natural),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Não',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                    backgroundColor: AppColor.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: const Text(
                    'Sim',
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                    backgroundColor: AppColor.grenn,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  onPressed: () => {
                    clienteController.delete(
                        cliente: Cliente(
                            nome: widget.cliente.nome,
                            telefone: widget.cliente.telefone,
                            historico: _listaHistorico)),
                    Navigator.of(context).pop(),
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.PROFSSIONAIS),
                  },
                ),
              ],
            );
          }),
    );
  }


*/
}
