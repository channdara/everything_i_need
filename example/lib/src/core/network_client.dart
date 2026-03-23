import 'package:everything_i_need/everything_i_need.dart';

class NetworkClient extends EinBaseDio {
  NetworkClient._internal();

  static NetworkClient? _instance;

  static NetworkClient get instance {
    _instance ??= NetworkClient._internal();
    return _instance!;
  }

  @override
  String baseUrl = 'https://jsonplaceholder.typicode.com';
}
