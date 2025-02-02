import '../../../data/datasources/local/client_datasource_local_datasource_impl.dart';
import '../../../data/dtos/client_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientStore with _$ClientController;

abstract class _ClientStore with Store {
  final ClientLocalDataSourceImpl clientLocalDataSource =
      Modular.get<ClientLocalDataSourceImpl>();

  List<ClientDto> repositories = [];

  @computed
  bool get hasResults =>
      listClient != ObservableFuture.value([]) &&
      listClient.status == FutureStatus.fulfilled;

  @observable
  ObservableFuture<List<ClientDto>> listClient = ObservableFuture.value([]);

  @action
  Future<List<ClientDto>> getAll() async {
    repositories = [];
    final result = clientLocalDataSource.getAll();
    listClient = ObservableFuture(result);
    repositories = await listClient;
    return repositories;
  }
}
