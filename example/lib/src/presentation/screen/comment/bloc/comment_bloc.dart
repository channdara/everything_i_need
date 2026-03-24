import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/repository/comment_repository_impl.dart';
import '../../../../domain/repository/comment_repository.dart';
import 'comment_bloc_state.dart';

class CommentBloc extends EinBaseBloc {
  final CommentRepository _commentRepository = CommentRepositoryImpl.instance;

  Future<void> fetchComment(int? postId, [bool refresh = true]) async {
    if (postId == null) return;
    await execute(
      requesting: () async {
        if (!refresh) startLoading();
        final response = await _commentRepository.comments(postId);
        stopLoading();
        safeEmit(CommentStateGotComments(response));
      },
    );
  }
}
