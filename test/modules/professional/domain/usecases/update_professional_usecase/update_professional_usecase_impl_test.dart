import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/professional/domain/usecases/update_professional_usecase/update_professional_usecase_impl.dart';
import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';

class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late UpdateProfessionalUseCaseImpl usecase;
  late ProfessionalEntity expectedProfessional;

  setUp(() {
    professionalRepository = ProfessionalRepositoryMock();
    usecase = UpdateProfessionalUseCaseImpl(professionalRepository);

    expectedProfessional = ProfessionalEntity(1,
        name: 'name', profession: 'profession', services: []);
  });

  test('deve retornar uma lista de ProfessionalEntity', () async {
    when(() => professionalRepository.updateProfessional(professionalEntity: expectedProfessional))
        .thenAnswer((_) async => Right(expectedProfessional));

    final result = await usecase.call(expectedProfessional);

    expect(result, equals(Right(expectedProfessional)));
  });
}
