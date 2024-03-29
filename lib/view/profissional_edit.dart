import 'package:agenda/components/side_menu.dart';
import 'package:flutter/material.dart';
//model
import '../models/profissional.dart';
import '../models/servicos.dart';
//repository
import '../repository/validator.dart';
//routes
import '../utils/routes.dart';
//database
import '../repository/profissional_controller.dart';
//components
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_picker/flutter_picker.dart';

class ProfissionalEdit extends StatefulWidget {
  Profissional profissional;
  ProfissionalEdit({required this.profissional});

  @override
  State<ProfissionalEdit> createState() => _ProfissionalEditState();
}

class _ProfissionalEditState extends State<ProfissionalEdit> {
  final _formKeyProfissional = GlobalKey<FormState>();
  final _nameEditController = TextEditingController();
  final _profissaoEditController = TextEditingController();
  var profissionalController = ProfissionalController();
  final _formKeyAddServico = GlobalKey<FormState>();
  final _nameServicoController = TextEditingController();
  final _servico = Servicos(nome: '',);
  List<Servicos> _listServico = [];

  /// salvar a duração
  @override
  void initState() {
    super.initState();
    _nameEditController.text = widget.profissional.nome;
    _profissaoEditController.text = widget.profissional.profissao;
    _listServico = widget.profissional.servicos;
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
                      children: [
                        _custoAppBar(),
                        _formContainer(context),
                        _formAddProfissao(),
                        _deletarProfissional(), //colocar padding bottomx
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

  _deletarProfissional() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextButton(
        child: const Text(
          'Deletar Profissional',
          style: TextStyle(
            color: AppColor.white,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
          backgroundColor: AppColor.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Deletar profissional',
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
                    'Você tem certeza que deseja deletar o profissional?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColor.natural,
                    ),
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
                      profissionalController.delete(
                        profissional: Profissional(
                            id: widget.profissional.id,
                            nome: widget.profissional.nome,
                            profissao: widget.profissional.profissao,
                            servicos: _listServico),
                      ),
                      Navigator.of(context).pop(),
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.PROFSSIONAIS),
                    },
                  ),
                ],
              );
            }),
        //onPressed
      ),
    );
  }

  DataRow _listaServicos(int index, Servicos servico) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            servico.nome,
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
                          'Deletar serviço',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: AppColor.natural),
                        )),
                    content: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                      child: const Text(
                        'Você tem certeza que deseja deletar esse serviço?',
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
                          setState(() => _listServico.removeAt(index));
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

  Widget _formAddProfissao() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Serviços',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.natural,
                ),
              ),
              _buttonAddServico(),
            ],
          ),
          _dataListaServicos(),
        ],
      ),
    );
  }

  _dataListaServicos() {
    if (widget.profissional.servicos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(
          'Adcione os serviços deste profissional',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
        ),
      );
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10.0),
      child: DataTable(
        columns: const [
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
          _listServico.length,
          (index) => _listaServicos(index, _listServico[index]),
        ),
      ),
    );
  }

  TextButton _buttonAddServico() {
    return TextButton.icon(
      icon: SvgPicture.asset(
        'asset/icones/Icon/add.svg',
        color: AppColor.white,
        width: 20,
        height: 20,
      ),
      label: const Text(
        'Adcionar Serviço',
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
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            scrollable: true,
            content: Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: Form(
                key: _formKeyAddServico,
                child: Column(
                  children: <Widget>[
                    _buildNameInput(),
                    _confirmButtonServico(),
                  ],
                ),
              ),
            ),
            //actions
          );
        }),
      ),
    );
  }

  TextFormField _buildNameInput() {
    return TextFormField(
      decoration: _inputdecoration('Serviço'),
      controller: _nameServicoController,
      validator: (value) {
        return Validator.isTextValid(value);
      },
      onSaved: (value) {
        setState(() {
          _servico.nome = value!;
        });
      },
    );
  }

  _confirmButtonServico() {
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
          'Adcionar Serviço',
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
          final form = _formKeyAddServico.currentState;
          if (form!.validate()) {
            form.save();
            _listServico.add(
              Servicos(nome: _servico.nome,),
            );
            profissionalController.update(
                profissional: Profissional(
                    id: widget.profissional.id,
                    nome: widget.profissional.nome,
                    profissao: widget.profissional.profissao,
                    servicos: _listServico));
            Navigator.of(context).pop();
            _nameServicoController.text = '';
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Serviço salvo com sucesso ')),
            );
          }
        }, //onPressed
      ),
    );
  }

  Widget _formContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Dados do Profissional',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.natural,
            ),
          ),
          Form(
            key: _formKeyProfissional,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: _editNome(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: _editProfissao(),
                ),
                _confirmButtonEdit(),
              ],
            ),
          ),
        ],
      ),
    );
  } //form Container

  _confirmButtonEdit() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: TextButton(
        child: const Text(
          'Editar Profissional',
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
          final form = _formKeyProfissional.currentState;
          if (form!.validate()) {
            form.save();
            profissionalController.update(profissional: widget.profissional);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Profissional editado com sucesso ')),
            );
          }
        }, //onPressed
      ),
    );
  }

  TextFormField _editProfissao() {
    return TextFormField(
      decoration: _inputdecoration('Profissao'),
      controller: _profissaoEditController,
      validator: (value) {
        return Validator.isTextValid(value);
      },
      onSaved: (value) {
        setState(() {
          widget.profissional.profissao = value!;
        });
      },
    );
  }

  TextFormField _editNome() {
    return TextFormField(
      decoration: _inputdecoration('Nome'),
      controller: _nameEditController,
      validator: (value) {
        return Validator.isTextValid(value);
      },
      onSaved: (value) {
        setState(() {
          widget.profissional.nome = value!;
        });
      },
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
                Navigator.pushReplacementNamed(context, AppRoutes.PROFSSIONAIS),
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
