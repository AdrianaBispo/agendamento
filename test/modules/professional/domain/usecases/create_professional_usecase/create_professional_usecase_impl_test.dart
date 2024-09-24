import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agenda/modules/clients/domain/usecases/create_client_usecase/create_client_usecase_impl.dart';
import 'package:agenda/modules/clients/domain/entities/client_entity.dart';
import 'package:agenda/modules/clients/domain/repositories/client_repository.dart';

class ProfessionalRepositoryMock extends Mock implements ProfessionalRepository {}

main() {
  late ProfessionalRepositoryMock professionalRepository;
  late CreateProfessionalUseCaseImpl usecase;
  late ProfessionalEntity expectedProfessional;

  setUp(() {
    clientRepository = ProfessionalRepositoryMock();
    usecase = CreateProfessionalUseCaseImpl(clientRepository);

    expectedProfessional = ProfessionalEntity(1,
        name: 'name', profession: 'profession', services: []);
  });

  test('deve retornar um ProfessionalEntity', () async {
    when(() => clientRepository.createProfessional(clientEntity: expectedProfessional))
        .thenAnswer((_) async => Right(expectedProfessional));

    final result = await usecase.call(expectedProfessional);

    expect(result, equals(Right(expectedProfessional)));
  });
}
