import 'package:agenda/modules/service/domain/entities/service_entity.dart';
import 'package:flutter_test/flutter_test.dart';

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
