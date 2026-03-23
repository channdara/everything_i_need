import 'package:everything_i_need/everything_i_need.dart';

import '../response/post.dart';

class PostSerializer extends EinBaseSerializer<Post> {
  @override
  Post fromJson(dynamic data) {
    return Post(
      (data['userId'] as num?)?.toInt(),
      (data['id'] as num?)?.toInt(),
      data['title'] as String?,
      data['body'] as String?,
    );
  }
}
