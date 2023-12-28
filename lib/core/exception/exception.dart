class ServerException implements Exception {
  final String errorMessage;
  final String errorCode;

  const ServerException({
    required this.errorMessage,
    required this.errorCode,
  });

  @override
  String toString() => 'ServerException(errorMessage: $errorMessage, errorCode: $errorCode)';
}
