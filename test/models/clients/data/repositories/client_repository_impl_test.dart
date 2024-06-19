import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/errors/error_client.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/data/datasources/client_datasource.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import 'package:agenda/modules/clients/data/repositories/client_repository_impl.dart';

class MockClientDataSource extends Mock implements ClientDataSource {}

void main() {
  late MockClientDataSource clienteData;
  late ClientRepositoryImpl clienteRepository;

  setUp(() {
    clienteData = MockClientDataSource();
    clienteRepository = ClientRepositoryImpl(clienteData);
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
    });

    test('Deve retornar um tipo de FailureGetAllClients', () async {
      when(() => clientRepository.getAllClient()).thenThrow(FailureGetAllClients);

      final result = await clientRepository.getAllClient();

      expect(result.fold((l) => l, (r) => null), isA<GetAllClientsException>());
    });

  });//getAll


  group('deleteClient', () {
    test('Deve retornar void quando deletar o registro', () async{
      when(() => clientRepository.deleteClient(1))
        .thenAnswer((_) async => Future.value());

      final result = await usecase.call(1);
      expect(result, equals(Right(null)));
    });

    test('deve retornar FailureDeleteClient ao falhar na exclusão', () async {
      when(() => clientRepository.deleteClient(1)).thenThrow(FailureDeleteClient);
      final result = await usecase.call(1);
      expect(result.fold((l) => l, (r) => null), isA<DeleteClientsException>());
    });

  });//deleteClient

  group('getClient', () {
    test('Deve retornar ClientEntity quando buscar um cliente com sucesso', () async {
      final ClientEntity expectedAnwer = client; 

      when(() => clientRepository.getClient(id: 1))
        .thenAnswer((_) async => expectedAnwer);

      final result = await clientRepository.getClient(id: 1);
      expect(result, equals(Right(expectedAnwer)));
    });

    test('Deve retornar um tipo de FailureGetClient ao falhar em obter um cliente', () async {
      when(() => clientRepository.getClient(id: 1)).thenThrow(FailureGetClient);
      final result = await clientRepository.getClient(id: 1);
      expect(result.fold((l) => l, (r) => null), isA<GetClientException>());
    });

  });//getClient

  
  group('updateClient', () {
    test('Deve retornar ClientEntity quando atualizar um cliente com sucesso', () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.updateClient(client: client))
        .thenAnswer((_) async => expectedAnwer);

      final result = await clientRepository.updateClient(client: expectedAnwer);
      expect(result, equals(Right(expectedAnwer)));
    });

    test('Deve retornar um tipo de FailureGetClient ao falhar em obter um cliente', () async {
      when(() => clientRepository.updateClient(client: client)).thenThrow(FailureUpdateClient);
      final result = await clientRepository.updateClient(client: expectedAnwer);
      expect(result.fold((l) => l, (r) => null), isA<UpdateClientException>());
    });

  });//updateClient


  group('createClient', () {
    test('Deve retornar ClientEntity ao criar um cliente com sucesso', () async {
      final ClientEntity expectedAnwer = client;

      when(() => clientRepository.createClient(client: cliente))
        .thenAnswer((_) async => expectedAnwer);

      final result = await clientRepository.createClient(client: expectedAnwer);
      expect(result, equals(Right(expectedAnwer)));
    });

    test('Deve retornar um tipo de FailureUpdateClient ao falhar em obter um cliente', () async {
      when(() => clientRepository.createClient(client: client)).thenThrow(FailureUpdateClient);
      final result = await clientRepository.createClient(client: expectedAnwer);
      expect(result.fold((l) => l, (r) => null), isA<UpdateClientException>());
    });

  });//createClient


}
