class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String tostring() {
    return '$_prefix$_message';
  }
}

class fetchDataException extends AppExceptions {
  fetchDataException([String? message])
      : super([message, 'Error During Communication']);
}

class badRequestException extends AppExceptions {
  badRequestException([String? message])
      : super([message, 'Invalid URL Request']);
}

class unAuthorizedRequest extends AppExceptions {
  unAuthorizedRequest([String? message])
      : super([message, 'UnAuthorized Request']);
}

class invalidInputException extends AppExceptions {
  invalidInputException([String? message])
      : super([message, 'InvalidInput Request']);
}
