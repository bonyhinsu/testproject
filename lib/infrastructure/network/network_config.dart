abstract class NetworkEnvironment {
  static const apiBackend = "";

  static const prodApiBackend = "api/v1/";
}

abstract class NetworkAPI {
  static const login = "";

  static var list = "https://jsonplaceholder.typicode.com/users";
  static var userList = "https://dummy.restapiexample.com/api/v1/employees";
  static var playerListBaseApi = "https://reqres.in/api/users";
}

abstract class NetworkParams {
  static var offset = "page";
}

abstract class NetworkConstants {
  static const password = "password";
  static const formUrlContentType = "application/x-www-form-urlencoded";
  static const validationError = 422;
  static const success = 200;
  static const deleteSuccess = 204;
  static const unAuthenticate = 401;

  /// Form field validation error.
  static const fieldErrorStatus = 422;
}
