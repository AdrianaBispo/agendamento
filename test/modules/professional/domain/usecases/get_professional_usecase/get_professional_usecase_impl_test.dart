import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/professional/domain/usecases/get_professional_usecase/get_professional_usecase_impl.dart';
import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';

class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late GetProfessionalUseCaseImpl usecase;
  late ProfessionalEntity expectedProfessional;

  setUp(() {
    professionalRepository = ProfessionalRepositoryMock();
    usecase = GetProfessionalUseCaseImpl(professionalRepository);

    expectedProfessional = ProfessionalEntityProfessionalEntity(1,
        name: 'name', profession: 'profession', services: []);
  });

  test('deve retornar um ProfessionalEntity', () async {
    when(() => professionalRepository.getProfessional(id: 1))
        .thenAnswer((_) async => Right(expectedProfessional));

    final result = await usecase.call(1);

    expect(result, equals(Right(expectedProfessional)));
  });
}
