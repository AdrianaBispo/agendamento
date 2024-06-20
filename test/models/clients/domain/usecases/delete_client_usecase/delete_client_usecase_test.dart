import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/domain/usecases/delete_client_usecase/delete_client_usecase_impl.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';

class ClientRepositoryMock extends Mock implements ClientRepository {}

main() {
  late ClientRepositoryMock clientRepository;
  late DeleteClientUseCaseImpl usecase;
  const clientId = 1;

  setUp(() {
    clientRepository = ClientRepositoryMock();
    usecase = DeleteClientUseCaseImpl(clientRepository);
  });

  test('Deve retornar null ao deletar o registro com sucesso', () async {
    when(() => clientRepository.deleteClient(clientId))
        .thenAnswer((_) async => const Right(null));
    final result = await usecase.call(clientId);
    expect(result, equals(const Right(null)));
  });

}
