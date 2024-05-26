import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ClientEntity clientEntity;

  setUp(() {
    clientEntity = ClientEntity(
        name: 'name', telephone: '+55 78 99999-9999', historic: []);
  });
  group('', () {
    test('Espero que a entidade não seja nula', () {
      expect(clientEntity, isNotNull);
    });

    test('Espero que o valor de nome seja "nome" ', () {
      expect(clientEntity.name, 'nome');
    });
  });
}
