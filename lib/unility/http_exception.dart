class CustomApiException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

//you can customize the UI using strings

  String toString() {
    
    print('http error: $_message');

    return '$_prefix$_message';
  }

  CustomApiException(this._message, this._prefix);
}

class FetachDataException extends CustomApiException {
  FetachDataException(message) : super(message, 'Faild to get data:\n');
}

class BadRequestException extends CustomApiException {
  BadRequestException(message) : super(message, 'Invalid Request "\n');
}

class UnauthorisedException extends CustomApiException {
  UnauthorisedException(message) : super(message, 'Unathorized"\n');
}

class InvaildInputException extends CustomApiException {
  InvaildInputException(message) : super(message, 'Invaild Input:\n');
}
