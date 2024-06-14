import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:agenda/modules/clients/domain/usecases/get_client_usecase/get_client_usecase.dart';
import 'package:dartz/dartz.dart';

class GetClientUseCaseImpl implements GetClientUseCase{
  final ClientRepository _clientRepository;

  GetClientUseCaseImpl(this._clientRepository);

  @override
  Future<Either<FailureGetClient, ClientEntity>> call(int id) async{
    return await _clientRepository.getClient(id);
  }

}