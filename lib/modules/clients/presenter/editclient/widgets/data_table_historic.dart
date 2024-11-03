import 'package:flutter/material.dart';
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
      return const Center(
        child: Text(
          'Não existem registros de serviços',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
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
          FittedBox(
            child: Text(
              name,
              style: AppTextStyle.instance.dataCell,
            ),
          ),
        ),
        DataCell(
          FittedBox(
            child: Text(
              description,
              style: AppTextStyle.instance.dataCell,
            ),
          ),
        ),
      ],
    );
  }
}
