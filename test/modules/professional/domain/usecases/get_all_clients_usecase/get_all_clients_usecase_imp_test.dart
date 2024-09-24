import 'package:agenda/modules/professional/domain/entities/professional_entity.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';
import 'package:agenda/modules/professional/domain/usecases/get_all_professional_usecase/get_all_professional_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late GetallProfessionalUseCaseImpl usecase;
  late List<ProfessionalEntity> expectedProfessionals;

  setUp(() {
    professionalRepository = ProfessionalRepositoryMock();
    usecase = GetallProfessionalUseCaseImpl(professionalRepository);

    expectedProfessionals = <ProfessionalEntity>[];
  });

  test('deve retornar uma lista de ProfessionalEntity', () async {
    when(() => professionalRepository.getAllProfessional())
        .thenAnswer((_) async => Right(expectedProfessionals));

    final result = await usecase.call();

    expect(result, equals(Right(expectedProfessionals)));
  });
}
