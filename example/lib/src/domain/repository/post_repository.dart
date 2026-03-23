import '../../data/response/post.dart';

abstract class PostRepository {
  Future<List<Post>> posts();
}
