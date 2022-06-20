import 'package:agenda/models/cliente.dart';
import 'package:flutter/material.dart';
//color
import '../components/colors.dart';
//ui
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final List<Cliente> clienteLista = [
    Cliente(nome: 'Cliente nome', telefone: '71 98874-0739', historico: []),
  ];
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              child: SizedBox(
                child: Column(
                  children: [
                    CustoAppBar(texto: 'Clientes'),
                    _buttonNovoCliente(),
                    _dataTableList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonNovoCliente() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: TextButton.icon(
          icon: SvgPicture.asset(
            'asset/icones/Icon/add.svg',
            color: AppColor.white,
            width: 20,
            height: 20,
          ),
          label: const Text(
            'Novo Cliente',
            style: TextStyle(
              color: AppColor.white,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
            backgroundColor: AppColor.blue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  _dataTableList() {
    return Container(
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
            label: Text(
              'Telefone',
              style: TextStyle(
                color: AppColor.natural,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          DataColumn(
            label: Text(''),
          ), //editar
          DataColumn(
            label: Text(''),
          ) // historico //criar uma pagina
        ],
        rows: List.generate(
          5, //clienteLista.length
          (index) => listaClientes(clienteLista[0]),
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
      DataCell(
        Text(
          cliente.telefone,
          style: const TextStyle(
            color: AppColor.natural,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      DataCell(
        //user edite
        IconButton(
          onPressed: () => {},
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.natural_2,
            width: 20,
            height: 20,
          ),
        ),
      ),
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
