import '../../../service/domain/entities/service_entity.dart';

class ProfessionalEntity {
  int? id;
  String name;
  String profession;
  List<ServiceEntity> services;
  ProfessionalEntity(
    this.id,{
    required this.name,
    required this.profession,
    required this.services,
  });
}
