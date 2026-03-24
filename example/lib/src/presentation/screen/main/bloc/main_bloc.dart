import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/repository/post_repository_impl.dart';
import '../../../../domain/repository/post_repository.dart';
import 'main_bloc_state.dart';

class MainBloc extends EinBaseBloc {
  final PostRepository _postRepository = PostRepositoryImpl.instance;

  Future<void> fetchPosts([bool refresh = true]) async {
    await execute(
      requesting: () async {
        if (!refresh) startLoading();
        final response = await _postRepository.posts();
        stopLoading();
        safeEmit(MainStateGotPosts(response));
      },
    );
  }
}
