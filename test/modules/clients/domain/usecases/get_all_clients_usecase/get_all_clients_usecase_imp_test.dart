import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';
import 'package:agenda/modules/clients/domain/usecases/get_all_clients_usecase/get_all_clients_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ClientRepositoryMock extends Mock implements ClientRepository {}

main() {
  late ClientRepositoryMock clientRepository;
  late GetallClientsUseCaseImpl usecase;
  late List<ClientEntity> expectedClients;

  setUp(() {
    clientRepository = ClientRepositoryMock();
    usecase = GetallClientsUseCaseImpl(clientRepository);

    expectedClients = <ClientEntity>[];
  });

  test('deve retornar uma lista de ClientEntity', () async {
    when(() => clientRepository.getAllClient())
        .thenAnswer((_) async => Right(expectedClients));

    final result = await usecase.call();

    expect(result, equals(Right(expectedClients)));
  });
}
