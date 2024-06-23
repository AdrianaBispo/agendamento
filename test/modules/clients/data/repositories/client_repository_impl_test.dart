import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:agenda/modules/historic/dtos/historic_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/data/datasources/client_datasource.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import 'package:agenda/modules/clients/data/repositories/client_repository_impl.dart';

class MockClientDataSource extends Mock implements ClientDataSource {}

void main() {
  late MockClientDataSource clientData;
  late ClientRepositoryImpl clientRepository;
  late ClientEntity client;

  setUp(() {
    clientData = MockClientDataSource();
    clientRepository = ClientRepositoryImpl(clientData);
    client = ClientDto(1,
        nameClient: 'Daiane Elisa Gabriela Rodrigues',
        telephoneClient: '71 98465-4754',
        historicClient: <HistoricDto>[]);
  });

  group('getAll', () {
    test('Deve retornar uma lista de ClientEntity ', () async {
      final List<ClientDto> expectedAnwer = [];
      when(() => clientData.getAll()).thenAnswer(
        (_) async => expectedAnwer,
      );

      final result = await clientRepository.getAllClient();

      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isA<List<ClientEntity>>());
      expect(clientRepository.getAllClient(), completes);
    });

    test('Deve retornar um tipo de FailureGetAllClients', () async {
      when(() => clientRepository.getAllClient())
          .thenThrow(FailureGetAllClients);

      final result = await clientRepository.getAllClient();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => id), isA<GetAllClientsException>());
    });
  }); //getAll

  group('deleteClient', () {
    test('Deve retornar void quando deletar o registro', () async {
      when(() => clientRepository.deleteClient(id: 1))
          .thenAnswer((_) async => const Right(null));

      final result = await clientRepository.deleteClient(id: 1);
      expect(result, equals(const Right(null)));
      expect(clientRepository.deleteClient(id: 1), completes);
    });

    test('deve retornar FailureDeleteClient ao falhar na exclusão', () async {
      when(() => clientRepository.deleteClient(id: 1))
          .thenThrow(FailureDeleteClient);
      final result = await clientRepository.deleteClient(id: 1);
      expect(result.fold((l) => l, (r) => id), isA<DeleteClientsException>());
      expect(result.isLeft(), true);
    });
  }); //deleteClient

  group('getClient', () {
    test('Deve retornar ClientEntity quando buscar um cliente com sucesso',
        () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.getClient(id: 1))
          .thenAnswer((_) async => Right(expectedAnwer));
      expect(clientRepository.getClient(id: 1), completes);
    });

    test(
        'Deve retornar um tipo de FailureGetClient ao falhar em obter um cliente',
        () async {
      when(() => clientRepository.getClient(id: 1)).thenThrow(FailureGetClient);
      final result = await clientRepository.getClient(id: 1);
      expect(result.fold((l) => l, (r) => id), isA<GetClientException>());
      expect(result.isLeft(), true);
    });
  }); //getClient

  group('updateClient', () {
    test('Deve retornar ClientEntity quando atualizar um cliente com sucesso',
        () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.updateClient(clientEntity: client))
          .thenAnswer((_) async => Right(expectedAnwer));
      expect(clientRepository.updateClient(clientEntity: expectedAnwer),
          completes);
    });

    test(
        'Deve retornar um tipo de FailureGetClient ao falhar em obter um cliente',
        () async {
      final ClientEntity expectedAnwer = client;
      when(() => clientRepository.updateClient(clientEntity: client))
          .thenThrow(FailureUpdateClient);
      final result =
          await clientRepository.updateClient(clientEntity: expectedAnwer);
      expect(result.fold((l) => l, (r) => null), isA<UpdateClientException>());
    });
  }); //updateClient

  group('createClient', () {
    test('Deve retornar ClientEntity ao criar um cliente com sucesso',
        () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.createClient(clientEntity: client))
          .thenAnswer((_) async => Right(expectedAnwer));

      final result =
          await clientRepository.createClient(clientEntity: expectedAnwer);
      expect(result, equals(Right(expectedAnwer)));
      expect(clientRepository.createClient(clientEntity: expectedAnwer),
          completes);
    });

    test(
        'Deve retornar um tipo de FailureUpdateClient ao falhar em obter um cliente',
        () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.createClient(clientEntity: client))
          .thenThrow(FailureUpdateClient);
      final result =
          await clientRepository.createClient(clientEntity: expectedAnwer);
      expect(result.fold((l) => l, (r) => null), isA<UpdateClientException>());
    });
  }); //createClient
}
