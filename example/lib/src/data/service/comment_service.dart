import 'package:everything_i_need/everything_i_need.dart';

import '../../core/network_client.dart';

class CommentService {
  CommentService._internal();

  static CommentService? _instance;

  static CommentService get instance {
    _instance ??= CommentService._internal();
    return _instance!;
  }

  final Dio _dio = NetworkClient.instance.dioInstance();

  Future<dynamic> comments(int postId) async {
    final response = await _dio.get<dynamic>(
      'posts/$postId/comments',
      options: Options(headers: {'Accept': 'application/json'}),
    );
    return response.data;
  }
}
