import '../../data/response/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> comments(int postId);
}
