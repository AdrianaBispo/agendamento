import 'package:flutter/material.dart';
//color
import '../components/colors.dart';
//ui
import '../components/side_menu.dart';
import '../components/circular_progress_custo.dart';
//repository
import '../repository/cliente_controller.dart';
import '../repository/profissional_controller.dart';
import '../repository/agenda_controller.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _clienteController = ClienteController();
  var _profissionalController = ProfissionalController();
  var _agendaController = AgendaController();
  int agendaHoje = 0;
  var formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  bool _loadingClientes = true;
  bool _loadingProfissioanais = true;
  bool _loadingAgenda = true;
  @override
  void initState() {
    super.initState();
    _realAll().then((value) => _loading = false);
  }

  Future<void> _realAll() async {
    await _clienteController.readAll();
    await _profissionalController.readAll();
    await _agendaController.readAll().then((value) {
      _agendaController.agendaList.forEach((element) {if (element.data == formattedDate){
        agendaHoje++;
      }});
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1, //takes 1/6 of the screen
              child: Container(
                color: AppColor.white,
                child: SideMenu(selected: const [true, false, false, false]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppColor.natural_7,
                child: _columnQuadrado(),
              ),
            ),
          ],
        ),
        //   flex: 5,
      ),
    );
  }

  Widget _columnQuadrado() {
    if (_loading) return CenteredCircularProgress();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _quadrados(
                quantidade: _clienteController.clienteList.length.toString(),
                total: 'Total de Clientes'),
            _quadrados(
                quantidade:
                    _profissionalController.profissionalList.length.toString(),
                total: 'Total de Profissionais'),
            _quadrados(
                quantidade: agendaHoje.toString(), total: 'Agendamentos para Hoje'),
          ],
        ),
      ],
    );
  }

  Widget _quadrados({required String quantidade, required String total}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  quantidade,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                total,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //_quadrados
}
