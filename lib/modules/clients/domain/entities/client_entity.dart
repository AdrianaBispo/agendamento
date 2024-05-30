import '../../../historic/domain/entities/historic_entity.dart';

class ClientEntity {
  int? id;
  String name;
  String telephone;
  List<HistoricEntity> historic;
  ClientEntity(
    this.id,{
    required this.name,
    required this.telephone,
    required this.historic,
  });
}
