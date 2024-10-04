part of 'models.dart';

/// Exception model for internet related exceptions
class CustomException implements Exception {
  CustomException(
    this._message,
    this._prefix,
  );

  final String? _message;
  final String _prefix;

  String get message => _message ?? "Something went wrong!";

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends CustomException {
  FetchDataException(
      [String message = 'Please check your internet and try again later.'])
      : super(message, '');
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised: ');
}

class TimeOutExceptionC extends CustomException {
  TimeOutExceptionC(
      [String message =
          'Something went wrong, please check your internet and try again later.'])
      : super(message, '');
}
