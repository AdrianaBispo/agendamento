import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/domain/usecases/get_client_usecase/get_client_usecase_impl.dart';
import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';

class ClientRepositoryMock extends Mock implements ClientRepository {}

main() {
  late ClientRepositoryMock clientRepository;
  late GetClientUseCaseImpl usecase;
  late ClientEntity expectedClient;

  setUp(() {
    clientRepository = ClientRepositoryMock();
    usecase = GetClientUseCaseImpl(clientRepository);

    expectedClient = ClientEntity(1,
        name: 'name', telephone: '+55 78 99999-9999', historic: []);
  });

  test('deve retornar um ClientEntity', () async {
    when(() => clientRepository.getClient(1))
        .thenAnswer((_) async => Right(expectedClient));

    final result = await usecase.call(1);

    expect(result, equals(Right(expectedClient)));
  });
}
