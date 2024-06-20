import 'package:flutter_test/flutter_test.dart';
import 'package:agenda/modules/service/domain/entities/services_entity.dart';

void main() {
  late ServiceEntity service;
  test('Deve retornar um service', () {
    service = ServiceEntity(description: 'description');
    expect(service.runtimeType, ServiceEntity);
  });
  test('Deve retornar em cada parametro os valores passados', () {
    service = ServiceEntity(description: 'description');
    expect(service.description, 'description');
  });
}
