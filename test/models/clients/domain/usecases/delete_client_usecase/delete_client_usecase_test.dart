import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/domain/usecases/delete_client_usecase/delete_client_usecase_impl.dart';
import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';

class ClientRepositoryMock extends Mock implements ClientRepository {}

main() {
  late ClientRepositoryMock clientRepository;
  late DeleteClientUseCaseImpl usecase;

  setUp(() {
    clientRepository = ClientRepositoryMock();
    usecase = DeleteClientUseCaseImpl(clientRepository);

    expectedClient = ClientEntity(1,
        name: 'name', telephone: '+55 78 99999-9999', historic: []);
  });

  test('deve retornar void ao deletar o registro', () async {
    when(() => clientRepository.deleteClient(1))
        .thenAnswer((_) async => Future.value());

    final result = await usecase.call(1);

    expect(result, equals(Right(null)));
  });

  test('deve retornar FailureDeleteClient ao falhar na exclusão', () async {
    // Arrange
    when(() => clientRepository.deleteClient(1)).thenThrow(Exception());

    // Act
    final result = await usecase.call(1);

    // Assert
    expect(result, isA<Left<FailureDeleteClient, void>>());
  });
}
