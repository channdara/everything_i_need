import '../../data/response/user.dart';

abstract class UserRepository {
  Future<List<User>> users();

  User? user(int? id);
}
