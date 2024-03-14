class ServerException implements Exception {
  String? message;
  ServerException([this.message]);
}

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class MapException implements Exception {
  final String message;

  MapException({required this.message});
}
