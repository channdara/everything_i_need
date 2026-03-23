import '../../domain/repository/post_repository.dart';
import '../response/post.dart';
import '../serializer/post_serializer.dart';
import '../service/post_service.dart';

class PostRepositoryImpl extends PostRepository {
  PostRepositoryImpl._internal();

  static PostRepositoryImpl? _instance;

  static PostRepositoryImpl get instance {
    _instance ??= PostRepositoryImpl._internal();
    return _instance!;
  }

  final PostService _postService = PostService.instance;

  @override
  Future<List<Post>> posts() async {
    final response = await _postService.posts();
    return PostSerializer().fromJsonList(response);
  }
}
