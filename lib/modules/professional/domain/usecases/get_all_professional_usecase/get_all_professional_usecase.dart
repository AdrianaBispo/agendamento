import 'package:dartz/dartz.dart';

import '../../entities/professional_entity.dart';
import '../../errors/error_professional.dart';


abstract class GetallProfessionalUseCase{
 Future<Either<FailureGetAllProfessional, List<Profissional>>> call();
}