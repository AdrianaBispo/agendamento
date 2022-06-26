import '../models/profissional.dart';
import '../database/profissionais_dao.dart';

class ProfissionalController {
  final _profissionalDAO = ProfissionalDAO();
  List<Profissional> profissionalList = [];

  void creat({required Profissional profissional}){
    _profissionalDAO.insert(profissional);
    profissionalList.add(profissional);
  }//creat

  Future<void> readAll() async{
    profissionalList.addAll(await _profissionalDAO.getAllProfissionais());
  }//real all

  void update({required Profissional profissional}){
    _profissionalDAO.updateProfissional(profissional.id!, profissional);
  }//update
  void delete({required Profissional profissional}){
    _profissionalDAO.deleteProfissional(id: profissional.id!);
    profissionalList.remove(profissional);
  }//delete
  void fechar(){
    _profissionalDAO.closer();
  }
}