// app_exceptions.dart
class AppExceptions implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  AppExceptions({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => message;
}
