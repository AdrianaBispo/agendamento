import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';
import 'package:agenda/modules/professional/domain/usecases/create_professional_usecase/create_professional_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';


class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late CreateProfessionalUseCaseImpl usecase;
  late ProfessionalEntity expectedProfessional;

  setUp(() {
    professionalRepository = ProfessionalRepositoryMock();
    usecase = CreateProfessionalUseCaseImpl(professionalRepository);

    expectedProfessional = ProfessionalEntity(1,
        name: 'name', profession: 'profession', services: []);
  });

  test('deve retornar um ProfessionalEntity', () async {
    when(() => professionalRepository.createProfessional(professionalEntity: expectedProfessional))
        .thenAnswer((_) async => Right(expectedProfessional));

    final result = await usecase.call(expectedProfessional);

    expect(result, equals(Right(expectedProfessional)));
  });
}
