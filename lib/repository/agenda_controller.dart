import '../models/agenda.dart';
import '../database/agenda_dao.dart';

class AgendaController {
  final _agendaDAO = AgendaDAO();
  List<Agenda> agendaList = [];

  void creat({required Agenda agenda}){
    _agendaDAO.insert(agenda);
    agendaList.add(agenda);
  }//creat

  Future<void> readAll() async{
    agendaList.addAll(await _agendaDAO.getAllAgendas());
  }//real all

  void update({required Agenda agenda}){
    _agendaDAO.updateAgenda(agenda.id!, agenda);
  }//update
  void delete({required Agenda agenda}){
    _agendaDAO.deleteAgenda(id: agenda.id!);
    agendaList.remove(agenda);
  }//delete
}