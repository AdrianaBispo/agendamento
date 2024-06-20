import 'package:flutter_test/flutter_test.dart';
import 'package:agenda/modules/historic/dtos/historic_dto.dart';

main() {
  late HistoricDto historicDto;

  setUp(
    () => historicDto =
        HistoricDto(nameProfessionalDto: 'name', servicesDto: 'services'),
  );
  test('Deve retornar um Map com o valores de historicDto', () {
    final historicMap = historicDto.toJson();
    expect(historicMap['nameProfessional'], historicDto.nameProfessionalDto);
    expect(historicMap['services'], historicDto.servicesDto);
  });

  test('Deve retornar um objeto HistoricDto com o valores de um map', () {
    final historic = HistoricDto.fromJson({'nameProfessional': 'name', 'services': 'service'});
    expect(historic.nameProfessionalDto, 'name');
    expect(historic.servicesDto, 'service');
  });
}
