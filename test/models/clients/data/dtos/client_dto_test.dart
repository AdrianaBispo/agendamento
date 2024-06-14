import 'package:agenda/modules/clients/data/dtos/client_dto.dart';
import 'package:agenda/modules/historic/dtos/historic_dto.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ClientDto clientDto1;
  late ClientDto clientDto2;

  setUp(() {
    clientDto1 = ClientDto(1,
        nameClient: 'Daiane Elisa Gabriela Rodrigues',
        telephoneClient: '71 98465-4754',
        historicClient: <HistoricDto>[]);
    clientDto2 = ClientDto(2,
        nameClient: 'Emilly Laís Bruna Cardoso',
        telephoneClient: '71 98518-0240',
        historicClient: [
          HistoricDto(
              nameProfessionalDto: 'nameProfessionalDto',
              servicesDto: 'servicesDto')
        ]);
  });

  test('Deve retornar um Json com os valores passados', () {
    final clientJson = clientDto1.toJson();
    expect(clientJson['id'], clientDto1.id);
    expect(clientJson['name'], clientDto1.nameClient);
    expect(clientJson['telephone'], clientDto1.telephoneClient);
    expect(clientJson['historic'], clientDto1.historicClient);
  });
  group('Deve retornar um ClientDto', () {
    test(
        'Deve retornar um ClientDto e uma instancia de HistoricDto na chave "historic"',
        () {
      final clientMap = ClientDto.fromJson({
        'id': 1,
        'name': 'Daiane Elisa Gabriela Rodrigues',
        'telephone': '71 98465-4754',
        'historic': <HistoricDto>[]
      });
      expect(clientMap.id, clientDto1.id);
      expect(clientMap.nameClient, clientDto1.nameClient);
      expect(clientMap.telephoneClient, clientDto1.telephoneClient);
      expect(clientMap.historicClient, clientDto1.historicClient);
    });
  });

  test(
      'Deve retornar um ClientDto como uma lista de HistoricDto',
      () {
    final clientMap = ClientDto.fromJson({
      'id': 2,
      'name': 'Emilly Laís Bruna Cardoso',
      'telephone': '71 98518-0240',
      'historic': [
        {'nameProfessional': 'nameProfessionalDto', 'services': 'servicesDto'}
      ],
    });
    expect(clientMap.id, clientDto2.id);
    expect(clientMap.nameClient, clientDto2.nameClient);
    expect(clientMap.telephoneClient, clientDto2.telephoneClient);
    expect(clientMap.historicClient[0].nameProfessionalDto, clientDto2.historicClient[0].nameProfessionalDto);
    expect(clientMap.historicClient[0].servicesDto, clientDto2.historicClient[0].servicesDto);
  });
}
