abstract class FailureGetAllClients implements Exception {}

class GetAllClientsException implements FailureGetAllClients {
  final String message;
  GetAllClientsException({required this.message});
}

abstract class FailureGetClient implements Exception {}

abstract class FailureCreateClient implements Exception {}

abstract class FailureUpdateClient implements Exception {}

abstract class FailureDeleteClient implements Exception {}

class deleteClientsException implements FailureGetAllClients {
  final String message;
  deleteClientsException({required this.message});
}