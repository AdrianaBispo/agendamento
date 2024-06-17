import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:dartz/dartz.dart';

import '../../errors/error_client.dart';
import 'delete_client_usecase.dart';

class DeleteClientUseCaseImpl implements DeleteClientUseCase {
  final ClientRepository _clientRepository;

  DeleteClientUseCaseImpl(this._clientRepository);

  @override
  Future<Either<FailureDeleteClient,void>> call(int id) async{
    return await _clientRepository.deleteClient(id);
  }
}