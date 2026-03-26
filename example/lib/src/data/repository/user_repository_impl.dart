import '../../domain/repository/user_repository.dart';
import '../response/user.dart';
import '../serializer/user_serializer.dart';
import '../service/user_service.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl._internal();

  static UserRepositoryImpl? _instance;

  static UserRepositoryImpl get instance {
    _instance ??= UserRepositoryImpl._internal();
    return _instance!;
  }

  final UserService _userService = UserService.instance;
  Map<int?, User> _mapUsers = {};

  @override
  Future<List<User>> users() async {
    final response = await _userService.users();
    final users = UserSerializer().fromJsonList(response);
    _mapUsers = {for (final user in users) user.id: user};
    return users;
  }

  @override
  User? user(int? id) => _mapUsers[id];
}
