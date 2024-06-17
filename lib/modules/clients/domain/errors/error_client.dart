abstract class FailureGetAllClients implements Exception {}

class GetAllClientsException implements FailureGetAllClients {
  final String message;
  GetAllClientsException({required this.message});
}

abstract class FailureGetClient implements Exception {}

class GetClientException implement FailureGetClient{
  final String message;
  GetClientException({required this.message});
}

abstract class FailureCreateClient implements Exception {}

class CreateClientException implement FailureCreateClient {
  final String message;
  CreateClientException({required this.message});
}


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