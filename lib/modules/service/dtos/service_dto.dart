import 'package:agenda/modules/service/domain/entities/service_entity.dart';

class ServiceDto extends ServiceEntity {
  final String descriptionDto;

  ServiceDto({
    required this.descriptionDto,
  }) : super(
    description: descriptionDto,
  );

  Map<String, String> toJson() {
    return {
      'description': description,
    };
  }

  factory ServiceDto.fromJson(Map<String, dynamic> map) {
    return ServiceDto(
      descriptionDto: map['description'], 
      );
  }
}