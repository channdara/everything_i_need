import '../../domain/repository/comment_repository.dart';
import '../response/comment.dart';
import '../serializer/comment_serializer.dart';
import '../service/comment_service.dart';

class CommentRepositoryImpl extends CommentRepository {
  CommentRepositoryImpl._internal();

  static CommentRepositoryImpl? _instance;

  static CommentRepositoryImpl get instance {
    _instance ??= CommentRepositoryImpl._internal();
    return _instance!;
  }

  final CommentService _commentService = CommentService.instance;

  @override
  Future<List<Comment>> comments(int postId) async {
    final response = await _commentService.comments(postId);
    return CommentSerializer().fromJsonList(response);
  }
}
