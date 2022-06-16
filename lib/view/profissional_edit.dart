import 'package:agenda/components/side_menu.dart';
import 'package:flutter/material.dart';
//model
import '../models/profissional.dart';
import '../models/servicos.dart';
//repository
import '../repository/validator.dart';
//database
import '../repository/profissional_controller.dart';
//components
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final _duracaoServicoController = TextEditingController();
  final _servico = Servicos(nome: '', duracao: '');
  @override
  void initState() {
    super.initState();
    _nameEditController.text = widget.profissional.nome;
    _profissaoEditController.text = widget.profissional.profissao;
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
                child: SingleChildScrollView(
                  primary: false,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      //alinhar verticalmento no top e horizontalmente no centro
                      children: [
                        _custoAppBar(),
                        _formContainer(context),
                        _formAddProfissao(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
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
        builder: (BuildContext context) => AlertDialog(
          scrollable: true,
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
            child: Form(
              key: _formKeyAddServico,
              child: Column(
                children: <Widget>[
                  _buildNameInput(),
                  _buildDuracaoInput(),
                  _confirmButtonServico(),
                ],
              ),
            ),
          ),
          //actions
        ),
      ),
    );
  }

  TextFormField _buildNameInput() {
    return TextFormField(
      decoration: _inputdecoration('Name'),
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

  TextFormField _buildDuracaoInput() {
    return TextFormField(
      decoration: _inputdecoration('Duração'),
      controller: _duracaoServicoController,
      validator: (value) {
        return Validator.isTextValid(value);
      },
      onSaved: (value) {
        setState(() {
          _servico.duracao = value!;
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
            widget.profissional.servicos.add(_servico);
            profissionalController.update(profissional: widget.profissional);
            Navigator.of(context).pop();
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
          Text('Dados do Profissional'),
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
            Navigator.of(context).pop();
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
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
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
                Navigator.pop(context),
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
        labelStyle: const TextStyle(color: AppColor.black, letterSpacing: 1.3),
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
