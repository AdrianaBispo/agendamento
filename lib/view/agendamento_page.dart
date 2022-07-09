import 'package:flutter/material.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart';
import '../repository/profissional_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
//models
import '../models/agenda.dart';
//color
import '../components/colors.dart';
//ui
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
import '../components/input_decoration.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgendamentoPage extends StatefulWidget {
  AgendamentoPage({Key? key});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPage();
}

class _AgendamentoPage extends State<AgendamentoPage> {
  final _firstDay = DateTime(2000);
  final _lastDay = DateTime(2050);
  var _focusedDay = DateTime.now();
  DateTime? selectedCalendarDate;
  Map<String, List<Agenda>> agendamentos = {};
  late List<Agenda> agendaController;
  String? clienteNomeController;
  String clienteTelefoneController = '';
  String? profissionalNomeController;
  String? profissionalServicosController;
  List<Servicos> _listaServicos = [];
  final _formKey = GlobalKey<FormState>();
  var _clienteController = ClienteController();
  var _profissionalController = ProfissionalController();
  Map<String, String> _listaClientes = {};
  Map<String, List<Servicos>> _listaProfissional = {};
  @override
  void initState() {
    super.initState();
    selectedCalendarDate = _focusedDay;
    agendaController = [
    ];

    agendaController.forEach((element) {
      var key = DateFormat('yyyy-MM-dd').format(element.horario);
      agendamentos[key] = [element];
    });
    _clienteController.readAll().then(
          (value) => _clienteController.clienteList.forEach((element) {
            var key = element.nome;
            _listaClientes[key] = element.telefone;
          }),
        );
    _profissionalController.readAll().then(
      (value) => _profissionalController.profissionalList.forEach((element) {
        var key = element.nome;
        _listaProfissional[key] = element.servicos;
      }),
    );
  } //intState

  List<Agenda> _listOfDayEvents(DateTime dateTime) {
    var formatted = DateFormat('yyyy-MM-dd').format(dateTime);
    return agendamentos[formatted] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        backgroundColor: AppColor.blue,
        label: const Text('Agendar Serviço'),
        icon: SvgPicture.asset(
          'asset/icones/Icon/calendar.svg',
          color: AppColor.white,
          width: 15,
          height: 15,
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColor.white,
                child: SideMenu(selected: const [false, true, false, false]),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: ListView(
                  children: [
                    CustoAppBar(texto: 'Agendamento'),
                    calendar(),
                    ..._listOfDayEvents(selectedCalendarDate!)
                        .map((eventos) => _eventTile(eventos)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _eventTile(Agenda agenda) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListTile(
        leading: SvgPicture.asset(
          'asset/icones/Icon/calendar.svg',
          color: AppColor.blueSecondary,
          width: 20,
          height: 20,
        ),
        shape: const Border(
          left: BorderSide(color: AppColor.blueSecondary, width: 3),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
              'Cliente: ${agenda.clienteNome} \nTelefone: ${agenda.clienteTelefone}'),
        ),
        subtitle: Text(
            'Servico: ${agenda.profissionalServico} \nProfissional: ${agenda.profissionalNome}\nHorario: ${agenda.horario}'),
      ),
    );
  }

  Widget calendar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: TableCalendar(
        //altura entre a linha do dia  e a primeira linha da data
        rowHeight: 60.0,
        //altura entre a linha da data
        daysOfWeekHeight: 40.0,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: AppColor.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            color: AppColor.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: AppColor.white,
            size: 24,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: AppColor.white,
            size: 24,
          ),
        ),
        calendarStyle: const CalendarStyle(
          canMarkersOverflow: true,
          weekendTextStyle: TextStyle(color: AppColor.black),
          todayDecoration:
              BoxDecoration(color: AppColor.blue, shape: BoxShape.circle),
          selectedDecoration: BoxDecoration(
            color: AppColor.blueSecondary,
            shape: BoxShape.circle,
          ),
        ),
        locale: 'pt_BR',
        focusedDay: _focusedDay,
        firstDay: _firstDay,
        lastDay: _lastDay,
        selectedDayPredicate: (day) {
          return isSameDay(selectedCalendarDate, day);
        },
        onDaySelected: _onDaySelected,
      ),
    );
  }

  void _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(selectedCalendarDate, selectedDay)) {
      setState(() {
        selectedCalendarDate = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('New Event'),
                  content: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: inputdecoration('Cliente'),
                              //onSaved: () => {},
                              value: clienteNomeController,
                              items: _listaClientes
                                  .map((nome, telefone) {
                                    return MapEntry(
                                      nome,
                                      DropdownMenuItem(
                                        value: nome,
                                        child: Text(nome),
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  clienteNomeController = val;
                                  clienteTelefoneController =
                                      _listaClientes[val]!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            child: InputDecorator(
                              decoration: inputdecoration('Telefone'),
                              child: Text(clienteTelefoneController),
                            ), //inputDecorator
                          ), //cliete telefone
                          /*                 profissionalNome: 'profissionalNome',
        profissionalServico: 'profissionalServico',
        horario: */
                          //Profissional Nome
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: inputdecoration('Profissional'),
                              //onSaved: () => {},
                              value: profissionalNomeController,
                              items: _listaProfissional
                                  .map((nome, servicos) {
                                    return MapEntry(
                                      nome,
                                      DropdownMenuItem(
                                        value: nome,
                                        child: Text(nome),
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  profissionalNomeController = val;
                                  _listaServicos = _listaProfissional[val]!;
                                });
                              },
                            ),
                          ),
                          //ProfissionalServico

                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: inputdecoration('Serviços'),
                              //onSaved: () => {},
                              value: profissionalServicosController,
                              items: _listaServicos.map<DropdownMenuItem<String>>((Servicos servico) {
                                return DropdownMenuItem(
                                  value: servico.nome,
                                  child: Text(servico.nome),
                                );
                              } ).toList(),
                              onChanged: (val) {
                                setState(() {
                                  profissionalServicosController = val;
                                  _listaServicos = _listaProfissional[val]!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        /*
                        if (titleController.text.isEmpty &&
                            descpController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter title & description'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          //Navigator.pop(context);
                          return;
                        } else {
                          setState(() {
                            if (mySelectedEvents[selectedCalendarDate] != null) {
                              mySelectedEvents[selectedCalendarDate]?.add(MyEvents(
                                  eventTitle: titleController.text,
                                  eventDescp: descpController.text));
                            } else {
                              mySelectedEvents[selectedCalendarDate!] = [
                                MyEvents(
                                    eventTitle: titleController.text,
                                   eventDescp: descpController.text)
                              ];
                            }
                          });

                         titleController.clear();
                          descpController.clear();

                          Navigator.pop(context);
                          return;
                        }*/
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            ));
  }
}
