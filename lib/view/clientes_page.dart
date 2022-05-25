import 'package:agenda/models/cliente.dart';
import 'package:flutter/material.dart';
//color
import '../const/colors.dart';
//ui
import 'ui/side_menu.dart';
import 'ui/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

/*
The ParentDataWidget Expanded(flex: 1) wants to apply ParentData of type FlexParentData to a RenderObject, which has been set up to accept ParentData of incompatible type BoxParentData.
 */
class _ClientesPageState extends State<ClientesPage> {
  final List<Cliente> clienteLista = [
    Cliente(nome: 'Cliente nome', telefone: '71 98874-0739', historico: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1, //takes 1/6 of the screen
                child: Container(
                  color: AppColor.white,
                  child: SideMenu(selected: [false, false, true, false]),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    children: [
                      CustoAppBar(texto: 'Clientes'),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Nome',
                                style: TextStyle(
                                  color: AppColor.natural,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text('Telefone'),
                            ),
                            DataColumn(
                              label: Text(''),
                            ), //editar
                            DataColumn(
                              label: Text(''),
                            ), //deletar
                            DataColumn(
                              label: Text(''),
                            ) // historico //criar uma pagina
                          ],
                          rows: List.generate(
                            5, //clienteLista.length
                            (index) => listaClientes(clienteLista[0]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow listaClientes(Cliente cliente) {
    return DataRow(cells: [
      DataCell(
        Text(
          cliente.nome,
          style: const TextStyle(
            color: AppColor.natural,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      DataCell(Text(cliente.telefone)),
      DataCell(
        IconButton(
          onPressed: () => {},
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.natural_2,
            width: 20,
            height: 20,
          ),
        ),
      ), //user edital
      DataCell(
        IconButton(
          onPressed: () => {},
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.natural_2,
            width: 20,
            height: 20,
          ),
        ),
      ), //deletar
      DataCell(
        IconButton(
          onPressed: () => {},
          icon: SvgPicture.asset(
            'asset/icones/Icon/calendar.svg',
            color: AppColor.natural_2,
            width: 20,
            height: 20,
          ),
        ), //agendar e historico
      ),
    ]);
  }
}
