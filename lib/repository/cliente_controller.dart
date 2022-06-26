import '../models/cliente.dart';
import '../database/cliente_dao.dart';

class ClienteController {
  final _clienteDAO = ClienteDAO();
  List<Cliente> clienteList = [];

  void creat({required Cliente cliente}){
    _clienteDAO.insert(cliente);
    clienteList.add(cliente);
  }//creat

  Future<void> readAll() async{
    clienteList.addAll(await _clienteDAO.getAllClientes());
  }//real all

  void update({required Cliente cliente}){
    _clienteDAO.updateCliente(cliente.id!, cliente);
  }//update
  void delete({required Cliente cliente}){
    _clienteDAO.deleteCliente(id: cliente.id!);
    clienteList.remove(cliente);
  }//delete
}