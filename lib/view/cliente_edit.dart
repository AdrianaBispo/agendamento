
import 'package:flutter/material.dart';
//model
import '../models/cliente.dart';
import '../models/historico.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart'; //database
//routes
import '../utils/routes.dart';
//components
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import '../components/input_decoration.dart';
import '../components/button_padrao.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_picker/flutter_picker.dart';
import '../components/conteiner_arredondado.dart';

class ClienteEdit extends StatefulWidget {
  Cliente cliente;
  ClienteEdit({required this.cliente});

  @override
  State<ClienteEdit> createState() => _ClienteEditState();
}

class _ClienteEditState extends State<ClienteEdit> {
  final _formKeyCliente = GlobalKey<FormState>();
  final _nameEditController = TextEditingController();
  final _telefoneEditController = TextEditingController();
  var clienteController = ClienteController();
  List<Historico> _listaHistorico = [];
  @override
  void initState() {
    super.initState();
    _nameEditController.text = widget.cliente.nome;
    _telefoneEditController.text = widget.cliente.telefone;
    _listaHistorico = widget.cliente.historico;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColor.white,
                child: SideMenu(
                  selected: const [false, false, false, false],
                ), //sideMenu
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _custoAppBar(),
                        _conteinerEditCliente(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: _dataListaHistorico(),
                        ),
                        _deletarCliente(),
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

  Widget _conteinerEditCliente() {
    return ContainerArredondado(
      widthDivider: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Dados do Cliente',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.natural,
            ),
          ),
          Form(
            key: _formKeyCliente,
            child: Column(
              children: [
                _editNome(),
                _editTelefone(),
                _confirmButtonEdit(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _editNome() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: inputdecoration('Nome'),
        controller: _nameEditController,
        validator: (value) {
          return Validator.isTextValid(value);
        },
        onSaved: (value) {
          setState(() {
            widget.cliente.nome = value!;
          });
        },
      ),
    );
  }

  Widget _editTelefone() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: inputdecoration('Telefone'),
        controller: _telefoneEditController,
        validator: (value) {
          return Validator.isTelefoneValid(value);
        },
        onSaved: (value) {
          setState(() {
            widget.cliente.telefone = value!;
          });
        },
      ),
    );
  }

  _confirmButtonEdit() {
    return ButtonPadrao(
      texto: 'Editar Cliente',
      color: AppColor.grenn,
      onPressed: () {
        final form = _formKeyCliente.currentState;
        if (form!.validate()) {
          form.save();
          clienteController.update(cliente: widget.cliente);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cliente editado com sucesso ')),
          );
        }
      }, //onPressed
    );
  }

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

  Widget _custoAppBar() {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.white,
              ),
              onPressed: () => {
                Navigator.pushReplacementNamed(context, AppRoutes.CLIENTES),
              },
            ),
          ),
          CustoAppBar(
            texto: 'Editar',
          ),
        ],
      ),
    ); //Custo AppBar
  }
}
