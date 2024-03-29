import 'package:agenda/components/circular_progress_custo.dart';
import 'package:agenda/models/cliente.dart';
import 'package:flutter/material.dart';
//view
import 'cliente_edit.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart';
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
  List<Cliente> clienteLista = [];
  final Cliente _clienteForm = Cliente(nome: '', telefone: '', historico: []);
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _telefoneController = TextEditingController();
  var _clienteController = ClienteController();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _clienteController.readAll().then((value) => setState(() {
          _loading = false;
        }));
    clienteLista = _clienteController.clienteList;
  }

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
                child: SideMenu(selected: const [false, false, true, false]),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        CustoAppBar(texto: 'Clientes'),
                        _buttonNovoCliente(context),
                        _dataTableList(),
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

  _buttonNovoCliente(BuildContext context) {
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
          onPressed: () => showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              scrollable: true,
              content: Container(
                width: MediaQuery.of(ctx).size.width / 2,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildNameInput(),
                      _buildTelefoneInput(),
                      _buildConfirmButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _dataTableList() {
    if (_loading) return CenteredCircularProgress();
    if (_clienteController.clienteList.isEmpty) {
      return const Text(
        'Adcione os seus primeiros clientes',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
      );
    }
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
          // DataColumn(
          //   label: Text(''),
          // ) // historico
        ],
        rows: List.generate(
          clienteLista.length,
          (index) => listaClientes(clienteLista[index]),
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
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) =>
                    ClienteEdit(cliente: cliente)),
              ),
            )
          },
          icon: SvgPicture.asset(
            'asset/icones/Icon/profile-2user.svg',
            color: AppColor.natural_2,
            width: 20,
            height: 20,
          ),
        ), //editar cliente
      // ),
      // DataCell(
      //   IconButton(
      //     onPressed: () => {},
      //     icon: SvgPicture.asset(
      //       'asset/icones/Icon/calendar.svg',
      //       color: AppColor.natural_2,
      //       width: 20,
      //       height: 20,
      //     ),
      //   ), //agendar e historico
      ),
    ]);
  }

  _buildNameInput() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        decoration: _inputdecoration('Nome'),
        controller: _nameController,
        validator: (value) {
          return Validator.isTextValid(value);
        },
        onSaved: (value) {
          setState(() {
            _clienteForm.nome = value!;
          });
        },
      ),
    );
  } //buildNameInput

  _buildTelefoneInput() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        decoration: _inputdecoration('Telefone'),
        controller: _telefoneController,
        validator: (value) {
          return Validator.isTelefoneValid(value);
        },
        onSaved: (value) {
          setState(() {
            _clienteForm.telefone = value!;
          });
        },
      ),
    );
  }

  _buildConfirmButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton.icon(
        icon: SvgPicture.asset(
          'asset/icones/Icon/add.svg',
          color: AppColor.white,
          width: 20,
          height: 20,
        ),
        label: const Text(
          'Novo Profissional',
          style: TextStyle(
            color: AppColor.white,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
          backgroundColor: AppColor.grenn,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: () {
          final form = _formKey.currentState;
          if (form!.validate()) {
            form.save();
            _clienteController.creat(cliente: _clienteForm);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Salvo com sucesso ')),
            );

            _nameController.clear();
            _telefoneController.clear();
          }
        }, //onPressed
      ),
    );
  }

  InputDecoration _inputdecoration(String labelText) => InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColor.black, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        isDense: true,
        fillColor: AppColor.white,
        focusColor: AppColor.white,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.natural_5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: AppColor.natural_5),
        ),
      );
}
