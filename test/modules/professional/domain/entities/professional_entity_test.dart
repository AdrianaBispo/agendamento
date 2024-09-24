import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ProfessionalEntity professionalEntity;

  setUp(() {
    professionalEntity = ProfessionalEntity(1,
        name: 'name', profession: 'profession', services: []);
  });
  group('', () {
    test('Espero que a entidade não seja nula', () {
      expect(professionalEntity, isNotNull);
    });

    test('Espero que o valor do id seja "1" ', () {
      expect(professionalEntity.id, 1);
    });
    test('Espero que o valor de nome seja "name" ', () {
      expect(professionalEntity.name, 'name');
    });
  });
}
