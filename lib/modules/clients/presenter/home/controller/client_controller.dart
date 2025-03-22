import 'package:agenda/modules/historic/dtos/historic_dto.dart';
import '../../../data/dtos/client_dto.dart';
import '../../../domain/repositories/client_repository.dart';

import 'package:mobx/mobx.dart';

part 'client_controller.g.dart';

class ClientController = _ClientStore with _$ClientController;

abstract class _ClientStore with Store {
  final ClientRepository _repository;

  _ClientStore(this._repository);

  @observable
  bool loading = false;

  @observable
  List<ClientDto> repositories = [];

  @action
  Future<List<ClientDto>> getAll() async {
    loading = true;
    final result = await _repository.getAllClient();

    if (result.isRight()) {
      result.fold(
        (failure) {
          repositories = [];
        },
        (right) {
          repositories = right.map((clientEntity) {
            return ClientDto(
              clientEntity.id,
              nameClient: clientEntity.name,
              telephoneClient: clientEntity.telephone,
              historicClient: clientEntity.historic.map((historicItem) {
                return HistoricDto(
                  nameProfessionalDto: historicItem.nameProfessional,
                  servicesDto: historicItem.service,
                );
              }).toList(),
            );
          }).toList();
        },
      );
    }
    loading = false;
    return repositories;
  }
}
