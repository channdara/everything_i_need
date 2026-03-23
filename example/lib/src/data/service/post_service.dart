import 'package:everything_i_need/everything_i_need.dart';

import '../../core/network_client.dart';

class PostService {
  PostService._internal();

  static PostService? _instance;

  static PostService get instance {
    _instance ??= PostService._internal();
    return _instance!;
  }

  final Dio _dio = NetworkClient.instance.dioInstance();

  Future<dynamic> posts() async {
    final response = await _dio.get<dynamic>('posts', options: Options(headers: {'Accept': 'application/json'}));
    return response.data;
  }
}
