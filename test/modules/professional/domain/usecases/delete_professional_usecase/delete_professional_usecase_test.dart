import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/professional/domain/usecases/delete_professional_usecase/delete_professional_usecase_impl.dart';
import 'package:agenda/modules/professional/domain/repositories/professional_repository.dart';

class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late DeleteProfessionalUseCaseImpl usecase;
  const professionalId = 1;

  setUp(() {
    professionalRepository = ProfessionalRepositoryMock();
    usecase = DeleteProfessionalUseCaseImpl(professionalRepository);
  });

  test('Deve retornar null ao deletar o registro com sucesso', () async {
    when(() => professionalRepository.deleteProfessional(id: professionalId))
        .thenAnswer((_) async => const Right(null));
    final result = await usecase.call(professionalId);
    expect(result, equals(const Right(null)));
  });

}
