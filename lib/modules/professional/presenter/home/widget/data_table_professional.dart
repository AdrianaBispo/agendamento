import 'package:agenda/core/theme/app_textstyle.dart';
import 'package:agenda/modules/professional/data/dtos/professional_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';

class DataTableProfessional extends StatelessWidget {
  final List<ProfessionalDto> listProfessional;
  const DataTableProfessional({
    Key? key,
    required this.listProfessional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.instance.secondaryBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Nome',
              style: AppTextStyle.instance.dataColumn,
            ),
          ),
          DataColumn(
            label: Text(
              'Profissão',
              style: AppTextStyle.instance.dataColumn,
            ),
          ),
          const DataColumn(
            label: Text(''),
          ), //editar
        ],
        rows: List.generate(
          listProfessional.length,
          (index) => listaProfissionais(listProfessional[index]),
        ),
      ),
    );
  }

  DataRow listaProfissionais(ProfessionalDto profissional) {
    return DataRow(cells: [
      DataCell(
        Text(
          profissional.professionProfessional,
          style: AppTextStyle.instance.dataCell,
        ),
      ),
      DataCell(
        Text(
          profissional.professionProfessional,
          style: AppTextStyle.instance.dataCell,
        ),
      ),
      DataCell(
        IconButton(
          onPressed: () => Modular.to.navigate(''),
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.instance.secondaryText,
            width: 20,
            height: 20,
          ),
        ),
      ), //user edite
    ]);
  }
}
