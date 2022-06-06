import '../models/profissional.dart';
import 'package:flutter/material.dart';
//ui
import '../components/colors.dart';
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
//repository
import '../repository/validator.dart';

class ProfissionaisPage extends StatefulWidget {
  const ProfissionaisPage({Key? key}) : super(key: key);

  @override
  State<ProfissionaisPage> createState() => _ProfissionaisPageState();
}

class _ProfissionaisPageState extends State<ProfissionaisPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _profissaoController = TextEditingController();
  final _formProfissional = Profissional(nome: '', profissao: '', servicos: []);
  final List<Profissional> profissionalLista = [
    Profissional(
        nome: 'Profissional nome', profissao: 'Profissão', servicos: []),
  ];

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
                child: SideMenu(selected: const [false, false, false, true]),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: Column(
                  children: [
                    CustoAppBar(texto: 'Profissionais'),
                    Align(
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
                            'Novo Profissional',
                            style: TextStyle(
                              color: AppColor.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
                            backgroundColor: AppColor.blue,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              scrollable: true,
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      _buildNameInput(),
                                    ],
                                  ),
                                ),
                              ),
                              //actions
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            label: Text(
                              'Profissão',
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
                          ), //deletar
                          DataColumn(
                            label: Text(''),
                          ) // historico //criar uma pagina
                        ],
                        rows: List.generate(
                          profissionalLista.length,
                          (index) => listaProfissionais(profissionalLista[0]),
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
    );
  }

  DataRow listaProfissionais(Profissional profissional) {
    return DataRow(cells: [
      DataCell(
        Text(
          profissional.nome,
          style: const TextStyle(
            color: AppColor.natural,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      DataCell(
        Text(
          profissional.profissao,
          style: const TextStyle(
            color: AppColor.natural,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      DataCell(
        IconButton(
          onPressed: () => {}, //editar o nome e a profissão
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
          onPressed: () => {}, // adcionar serviços
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

  _buildNameInput() {
    return TextFormField(
      controller: _nameController,
      validator: (value) {
        return Validator.isTextValid(value);
      },
      onSaved: (value) {
        setState(() {
          _formProfissional.nome = value!;
        });
      },
    );
  } //buildNameInpurt
}
