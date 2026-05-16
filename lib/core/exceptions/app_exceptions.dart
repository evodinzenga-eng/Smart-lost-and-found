/// Custom exception classes for error handling
class AppException implements Exception {
  final String message;
  final String? code;

  AppException({
    required this.message,
    this.code,
  });

  @override
  String toString() => message;
}

/// Authentication related exceptions
class AuthException extends AppException {
  AuthException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

/// Network related exceptions
class NetworkException extends AppException {
  NetworkException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

/// Firebase related exceptions
class FirebaseException extends AppException {
  FirebaseException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

/// Validation related exceptions
class ValidationException extends AppException {
  final Map<String, String>? errors;

  ValidationException({
    required String message,
    String? code,
    this.errors,
  }) : super(
    message: message,
    code: code,
  );
}

/// Resource not found exception
class NotFoundException extends AppException {
  NotFoundException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

/// Permission denied exception
class PermissionException extends AppException {
  PermissionException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

/// Server error exception
class ServerException extends AppException {
  final int? statusCode;

  ServerException({
    required String message,
    String? code,
    this.statusCode,
  }) : super(
    message: message,
    code: code,
  );
}

/// Cache related exception
class CacheException extends AppException {
  CacheException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}
