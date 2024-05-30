
import 'package:agenda/modules/historic/dtos/historic_dto.dart';

import '../../domain/entities/client_entity.dart';

class ClientDto extends ClientEntity {
  final int? idClient;
  final String nameClient;
  final String telephoneClient;
  final List<HistoricDto> historicClient;
  ClientDto(
    this.idClient, {
    required this.nameClient,
    required this.telephoneClient,
    required this.historicClient,
  }) : super(
   idClient,
          name: nameClient,
          telephone: telephoneClient,
          historic: historicClient,
        );

  Map<String, dynamic> toJson() {
    return {
      'idClient': idClient,
      'nameClient': nameClient,
      'telephoneClient': telephoneClient,
      'historicClient': historicClient.map((historic) => historic.toJson()).toList(),
    };
  }

   factory ClientDto.fromJson(Map<String, dynamic> map) {
    return ClientDto(
      map['id'],
      nameClient: map['nameClient'],
      telephoneClient: map['telephone'],
      historicClient: map['historic'] != null
          ? List.from(map['historic'])
              .map((e) => HistoricDto.fromJson(e))
              .toList()
          : <HistoricDto>[], 
    );
  }

 
}
