
import 'package:agenda/modules/clients/domain/entities/client_entity.dart';

import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';

import 'package:dartz/dartz.dart';

import 'get_all_clients_usecase.dart';

class GetallClientsUseCaseImp implements GetallClientsUseCase{
  final ClientRepository _clientRepository;

  GetallClientsUseCaseImp(this._clientRepository);

  @override
  Future<Either<FailureCreateClient, List<ClientEntity>>> call() async{
    return await _clientRepository.getAllClient();
  }
}