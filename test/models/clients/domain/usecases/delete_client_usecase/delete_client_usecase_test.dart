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

  test('Deve retornar Right(null) ao deletar o registro com sucesso', () async {
    when(() => clientRepository.deleteClient(clientId))
        .thenAnswer((_) async => Future.value());
    final result = await usecase.call(clientId);
    expect(result, equals(Right(null)));
  });

  test('deve retornar FailureDeleteClient ao falhar na exclusão', () async {
    when(() => clientRepository.deleteClient(1)).thenThrow(Exception());
    final result = await usecase.call(1);
    expect(result, isA<Left<FailureDeleteClient, void>>());
  });
}
