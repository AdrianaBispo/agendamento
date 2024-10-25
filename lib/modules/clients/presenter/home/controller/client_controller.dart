import '../../../data/datasources/local/client_datasource_local_datasource_impl.dart';
import '../../../data/dtos/client_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientStore with _$ClientController;

abstract class _ClientStore with Store {
  final ClientLocalDataSourceImpl clientLocalDataSource =
      Modular.get<ClientLocalDataSourceImpl>();

  @action
  Future<List<ClientDto>> getAll() {
    return clientLocalDataSource.getAll();
  }
}
