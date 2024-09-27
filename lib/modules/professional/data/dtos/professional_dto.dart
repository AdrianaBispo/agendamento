
class ProfessionalDto extends ProfessionalEnttity {
  final int? idProfessional;
  final String nameProfessional;
  final String professionProfessional;
  final List<ServiceEntity> servicesProfessional;
  ProfessionalDto(
    idProfessional, {
    required this.nameProfessional,
    required this.professionProfessional,
    required this.servicesProfessional,
  }): super(
    idProfessional, {
      name: nameProfessional,
      profession: professionProfessional,
      services: servicesProfessional,
    }
  );

  Map<String, dynamic> toJson() {
    return {
      'id': idProfessional,
      'name': nameProfessional,
      'profession': professionProfessional,
      'services': servicesProfessional.map((e) => e.toJson()).toList(),
    };
  }

  factory ProfessionalDto.fromJson(Map<String, dynamic> map) {
    return ProfessionalDto(
      map['id'],
      nameProfessional: map['name'],
      professionProfessional: map['profession'],
      servicesProfessional: map['services'] != null
          ? List.from(map['services'])
              .map((e) => ServiceDto.fromJson(e))
              .toList()
          : <ServiceDto>[],
    );
  }
}