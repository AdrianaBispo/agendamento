import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:agenda/modules/clients/domain/usecases/update_client_usecase/update_client_usecase.dart.dart';
import 'package:dartz/dartz.dart';

class UpdateClientUseCaseImpl implements UpdateClientUseCase {
  final ClientRepository _clientRepository;

  UpdateClientUseCaseImpl(this._clientRepository);

  @override
  Future<Either<FailureUpdateClient, ClientEntity>> call(ClientEntity clientEntity) async{
    return await _clientRepository.updateClient(clientEntity: clientEntity);
  }

  
}