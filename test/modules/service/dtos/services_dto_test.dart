import 'package:agenda/modules/service/domain/entities/service_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ServiceDto serviceDto;
  
  setUp(
    () => serviceDto =
        ServiceDto(descriptionDto: 'description'),
  );
  test('Deve retornar um Map com o valores de serviceDto', () {
    final serviceDto = ServiceDto.toJson();
    expect(serviceDto['description'], serviceDto.description);
   });

  test('Deve retornar um objeto ServiceDto com o valores de um map', () {
    final service = ServiceDto.fromJson({'description': 'description'});
    expect(service.descriptionDto, 'description');
  });
}
