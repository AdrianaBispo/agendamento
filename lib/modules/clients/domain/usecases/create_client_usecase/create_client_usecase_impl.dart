import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:dartz/dartz.dart';

import '../../errors/error_client.dart';
import '../../repositories/client_repository.dart';
import 'create_client_usecase.dart';

class CreateClientUseCaseImpl implements CreateClientUseCase {
  final ClientRepository _clientRepository;

  CreateClientUseCaseImpl(this._clientRepository);

  @override
  Future<Either<FailureCreateClient, void>> call(ClientEntity clientEntity) async{
    return await _clientRepository.createClient(clientEntity: clientEntity);
  }
}
