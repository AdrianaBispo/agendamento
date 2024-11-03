import 'package:flutter/material.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_textstyle.dart';
import '../../../../historic/dtos/historic_dto.dart';

class DataTableHistoric extends StatelessWidget {
  final List<HistoricDto> listHistoric;
  const DataTableHistoric({
    Key? key,
    required this.listHistoric,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listHistoric.isEmpty) {
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
      columns: [
        DataColumn(
          label: Text(
            'Profissional',
            style: AppTextStyle.instance.dataColumn,
          ),
        ),
        DataColumn(
          label: Text(
            'Serviço',
            style: AppTextStyle.instance.dataColumn,
          ),
        ),
        const DataColumn(
          label: Text(''),
        ), //editar
      ],
      rows: List.generate(
        listHistoric.length,
        (index) => rowHistoric(
          name: listHistoric[index].nameProfessionalDto,
          description: listHistoric[index].servicesDto,
          context: context,
        ),
      ),
    );
  }

  DataRow rowHistoric({
    required String name,
    required String description,
    required BuildContext context,
  }) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            name,
            style: AppTextStyle.instance.dataCell,
          ),
        ),
        DataCell(
          Text(
            description,
            style: AppTextStyle.instance.dataCell,
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () {},
            /*=> showDialog(
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
                  
                }),*/
            //editar o name e a profissão
            icon: Icon(
              Icons.delete_sharp,
              color: AppColor.instance.secondaryText,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
