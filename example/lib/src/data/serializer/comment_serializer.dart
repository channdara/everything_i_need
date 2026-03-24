import 'package:everything_i_need/everything_i_need.dart';

import '../response/comment.dart';

class CommentSerializer extends EinBaseSerializer<Comment> {
  @override
  Comment fromJson(dynamic data) {
    return Comment(
      (data['postId'] as num?)?.toInt(),
      (data['id'] as num?)?.toInt(),
      data['name'] as String?,
      data['email'] as String?,
      data['body'] as String?,
    );
  }
}
