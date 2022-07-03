import 'package:flutter/material.dart';
//repository
import '../repository/validator.dart';
import '../repository/cliente_controller.dart';
import 'package:table_calendar/table_calendar.dart';
//color
import '../components/colors.dart';
//ui
import '../components/side_menu.dart';
import '../components/custom_appBar.dart';
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

  @override
  void initState() {
    super.initState();
    selectedCalendarDate = _focusedDay;
  }

  List<Agenda> _listOfDayEvents(DateTime dateTime) {
    var formatted = DateFormat('yyyy-MM-dd').format(dateTime);
    return agendamentos[formatted] ?? [];
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
                        .map((eventos) => _eventTile()),
                  ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  _eventTile() {
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
        title: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text('Cliente: cliente \nTelefone: tele'),
        ),
        subtitle: const Text('Servico: Servico \nProfissional: profissional'),
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
}
