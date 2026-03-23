import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/repository/post_repository_impl.dart';
import '../../../../domain/repository/post_repository.dart';
import 'main_bloc_state.dart';

class MainBloc extends EinBaseBloc {
  final PostRepository _postRepository = PostRepositoryImpl.instance;

  void fetchPosts() {
    execute(
      requesting: () async {
        startLoading();
        final response = await _postRepository.posts();
        await Future<dynamic>.delayed(const Duration(seconds: 1));
        stopLoading();
        safeEmit(MainStateGotPosts(response));
      },
    );
  }
}
