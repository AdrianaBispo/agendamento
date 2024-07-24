class serviceDto extends ServiceEntity {
  final String descriptionDto;

  ServiceDto({
    required this.descriptionDto,
  }): super(
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