//to handle exceptions in app
class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

//When there is an error during communication with server as like the timeout
// request or network issue like slow network
class fetchDataException extends AppExceptions {
  fetchDataException([String? message])
      : super(message, 'Error During Communication');
}

//when the url requested not exist on server and user want to access it
class badRequestException extends AppExceptions {
  badRequestException([String? message]) : super(message, 'Invalid Request');
}

//Every user have a token when he/she login or signup and when usr don't have that token
// but still have access to the data of app that is called unauthorized exception
class unAuthorizedException extends AppExceptions {
  unAuthorizedException([String? message])
      : super(message, 'Unauthorized Access');
}

//for the validation of input
class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
