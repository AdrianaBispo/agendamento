abstract class FailureGetAllClients implements Exception {}

class GetAllClientsException implements FailureGetAllClients {
  final String message;
  GetAllClientsException({required this.message});
}

abstract class FailureGetClient implements Exception {}

abstract class FailureCreateClient implements Exception {}

abstract class FailureUpdateClient implements Exception {}

class UpdateClientException implements FailureUpdateClient {
  final String message;
  UpdateClientException({required this.message});
}

abstract class FailureDeleteClient implements Exception {}

class DeleteClientsException implements FailureGetAllClients {
  final String message;
  DeleteClientsException({required this.message});
}