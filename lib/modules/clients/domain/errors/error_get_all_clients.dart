abstract class FailureGetAllClients implements Exception {}

class GetAllClientsException implements FailureGetAllClients {
  final String message;
  GetAllClientsException({required this.message});
}