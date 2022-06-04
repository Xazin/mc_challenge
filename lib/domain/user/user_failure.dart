class UserFailure {
  final String message;
  final int? statusCode;

  UserFailure({
    required this.message,
    this.statusCode,
  });
}
