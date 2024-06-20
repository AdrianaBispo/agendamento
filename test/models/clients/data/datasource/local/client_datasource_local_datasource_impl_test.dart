import 'package:flutter_test/flutter_test.dart';
import 'package:agenda/modules/historic/dtos/historic_dto.dart';
import 'package:agenda/modules/clients/data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

void main() {
  late ClientLocalDataSourceImpl dataSource;
  late ClientDto client;

  setUp(() async {
    dataSource = ClientLocalDataSourceImpl();
    client = ClientDto(1,
        nameClient: 'Daiane Elisa Gabriela Rodrigues',
        telephoneClient: '71 98465-4754',
        historicClient: <HistoricDto>[]);
  });

  group('getAll', () {
    test('Deve retornar uma lista de ClientDto ao chamar getAll', () async {
      final result = await dataSource.getAll();
      expect(result, isA<List<ClientDto>>());
    });
  });

  group('delete', () {
    test('Deve retornar void quando deletar o registro', () async{
      expect( () async => await dataSource.deleteClient(id: 1), isA<void>(),);
    });
  });

  group('getClient', () {
    test('Deve retornar um ClienteDto ao obter um cliente pelo id', () async{
      final result = await dataSource.getClient(id: 1);
      expect(result, isA<ClientDto>());
    });    
  });

  group('updateClient', () {
    test('Deve retornar um ClienteDto ao atualizado o cliente', () async{
      final result = await dataSource.updateClient(client: client);
      expect(result, isA<ClientDto>());
    });    
  });

  group('createClient', () {
    test('Deve retornar um ClienteDto ao criar um cliente', () async{
      final result = await dataSource.createClient(client: client);
      expect(result, isA<ClientDto>());
    }); 
  });
}
