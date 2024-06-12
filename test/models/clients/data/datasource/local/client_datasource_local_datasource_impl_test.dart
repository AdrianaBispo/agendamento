import 'package:flutter_test/flutter_test.dart';
import 'package:agenda/modules/clients/data/datasources/local/client_datasource_local_datasource_impl.dart';
import 'package:agenda/modules/clients/data/dtos/client_dto.dart';

void main() {
  late ClientLocalDataSourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    dataSource = ClientLocalDataSourceImpl();
  });

  group('getAll', () {
    test('Deve retornar uma lista de ClientDto ', () async {
      final result = await dataSource.getAll();
      expect(result, isA<List<ClientDto>>());
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
