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
      when(() => clienteData.getAll()).thenAnswer(
        (_) async => expectedAnwer,
      );

      final result = await clienteRepository.getAllClient();
 
      expect(result, isA<Right>());
      expect(result.getOrElse(() => []), isA<List<ClientEntity>>());
    });

    test('Deve retornar um tipo de FailureGetAllClients', () async {
      when(() => clienteRepository.getAllClient()).thenThrow(FailureGetAllClients);

      final result = await clienteRepository.getAllClient();

      expect(result.fold((l) => l, (r) => null), isA<GetAllClientsException>());
    });

  });
}
