import 'package:everything_i_need/everything_i_need.dart';

import '../../core/network_client.dart';

class UserService {
  UserService._internal();

  static UserService? _instance;

  static UserService get instance {
    _instance ??= UserService._internal();
    return _instance!;
  }

  final Dio _dio = NetworkClient.instance.dioInstance();

  Future<dynamic> users() async {
    final response = await _dio.get<dynamic>(
      'users',
      options: Options(headers: {'Accept': 'application/json'}),
    );
    return response.data;
  }
}
