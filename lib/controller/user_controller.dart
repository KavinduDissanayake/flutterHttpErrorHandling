import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/repository/repository.dart';

class UserController {
  final Repository _repository;
  UserController(this._repository);

  Future<List<User>> fetchUserList() async {
    return _repository.getUsers();
  }
}
