import 'package:agenda/modules/service/dtos/service_dto.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ServiceDto serviceDto;

  setUp(() {
    serviceDto = ServiceDto(descriptionDto: '');
  });

  test('Deve retornar um Map com o valores de serviceDto', () {
    print(serviceDto.description);
    final service = serviceDto.toJson();
    expect(service['description'], serviceDto.descriptionDto);
  });

  test('Deve retornar um objeto ServiceDto com o valores de um map', () {
    final service = ServiceDto.fromJson({'description': 'description'});
    expect(service.descriptionDto, 'description');
  });
}
