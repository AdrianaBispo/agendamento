abstract class FailureGetAllProfessional implements Exception {}

class GetAllProfessionalException implements FailureGetAllProfessional {
  final String message;
  GetAllProfessionalException({required this.message});
}

abstract class FailureGetProfessional implements Exception {}

class GetProfessionalException implements FailureGetProfessional{
  final String message;
  GetProfessionalException({required this.message});
}

abstract class FailureCreateProfessional implements Exception {}

class CreateProfessionalException implements FailureCreateProfessional {
  final String message;
  CreateProfessionalException({required this.message});
}


abstract class FailureUpdateProfessional implements Exception {}

class UpdateProfessionalException implements FailureUpdateProfessional {
  final String message;
  UpdateProfessionalException({required this.message});
}

abstract class FailureDeleteProfessional implements Exception {}

class DeleteProfessionalException implements FailureDeleteProfessional {
  final String message;
  DeleteProfessionalException({required this.message});
}