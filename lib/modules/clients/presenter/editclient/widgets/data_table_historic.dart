import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//Core
import 'package:agenda/core/utils/app_color.dart';
import 'package:agenda/core/utils/app_textstyle.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

class DataTableHistoric extends StatelessWidget {
  final List<ClientDto> listClient;
  const DataTableHistoric({
    Key? key,
    required this.listClient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   if (widget.cliente.historico.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Center(
          child: Text(
            'Não existem registros de serviços',
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
          listClient.length,
          (index) => listHistoric(
            listClient[index],
          ),
        ),
    );
  }

  DataRow listHistoric(ClientDto cliente) {
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
}
