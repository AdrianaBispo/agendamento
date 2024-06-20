import 'package:agenda/modules/historic/domain/entities/historic_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HistoricEntity historic;
  test('Deve retornar um Historic', () {
    historic = HistoricEntity(nameProfessional: 'name', service: 'service');
    expect(historic.runtimeType, HistoricEntity);
  });
  test('Deve retornar em cada parametro os valores passados', () {
    historic = HistoricEntity(nameProfessional: 'name', service: 'service');
    expect(historic.nameProfessional, 'name');
    expect(historic.service, 'service');
  });
}
