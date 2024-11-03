import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
//theme
import 'package:agenda/core/theme/app_color.dart';
import 'package:agenda/core/theme/app_textstyle.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

class DataTableCliente extends StatelessWidget {
  final List<ClientDto> listClient;
  const DataTableCliente({
    Key? key,
    required this.listClient,
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
        columnSpacing: 10,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Nome',
              style: AppTextStyle.instance.dataColumn,
            ),
          ),
          DataColumn(
            label: Text(
              'Telefone',
              style: AppTextStyle.instance.dataColumn,
            ),
          ),
          const DataColumn(
            label: Text(''),
          ), //editar
          const DataColumn(
            label: Text(''),
          ) // historico
        ],
        rows: List.generate(
          listClient.length,
          (index) => listaClientes(
            listClient[index],
          ),
        ),
      ),
    );
  }

  DataRow listaClientes(ClientDto client) {
    return DataRow(cells: [
      DataCell(
        FittedBox(
          child: Text(
            client.name,
            style: AppTextStyle.instance.dataCell,
          ),
        ),
      ),
      DataCell(
        FittedBox(
          child: Text(
            client.telephone,
            style: AppTextStyle.instance.dataCell,
          ),
        ),
      ),
      DataCell(
        //user edite
        IconButton(
          onPressed: () => Modular.to.navigate(
            '/clients/editclient',
            arguments: ClientDto(
              client.idClient,
              nameClient: client.nameClient,
              telephoneClient: client.telephoneClient,
              historicClient: client.historicClient,
            ),
          ),
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.instance.secondaryText,
            width: 20,
            height: 20,
            ),
          ),
        ), //editar cliente
      DataCell(
        FittedBox(
          child: IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              'asset/icones/Icon/calendar.svg',
              color: AppColor.instance.secondaryText,
              width: 20,
              height: 20,
            ),
          ),
        ), //agendar e historico
      ),
    ]);
  }
}
