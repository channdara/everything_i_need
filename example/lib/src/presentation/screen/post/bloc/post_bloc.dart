import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/repository/post_repository_impl.dart';
import '../../../../data/repository/user_repository_impl.dart';
import '../../../../data/response/user.dart';
import '../../../../domain/repository/post_repository.dart';
import '../../../../domain/repository/user_repository.dart';
import 'post_bloc_state.dart';

class PostBloc extends EinBaseBloc {
  final PostRepository _postRepository = PostRepositoryImpl.instance;
  final UserRepository _userRepository = UserRepositoryImpl.instance;

  Future<void> fetchPosts([bool refresh = true]) async {
    await execute(
      requesting: () async {
        if (!refresh) startLoading();
        final response = await _postRepository.posts();
        stopLoading();
        safeEmit(PostStateGotPosts(response));
      },
    );
  }

  User? getUser(int? userId) => _userRepository.user(userId);
}
