import 'package:agenda/modules/historic/domain/entities/historic_entity.dart';

class HistoricDto extends HistoricEntity {
  final String nameProfessionalDto;
  final String servicesDto;

  HistoricDto({
    required this.nameProfessionalDto,
    required this.servicesDto,
  }) : super(
          nameProfessional: nameProfessionalDto,
          service: servicesDto,
        );

  Map<String, String> toJson() {
    //convert para map
    return {
      'nameProfessional': nameProfessionalDto,
      'services': servicesDto,
    };
  }

  factory HistoricDto.fromJson(Map<String, dynamic> map) {
    //toJson
    return HistoricDto(
      nameProfessionalDto: map['nameProfessional'],
      servicesDto: map['services'],
    );
  }
}
