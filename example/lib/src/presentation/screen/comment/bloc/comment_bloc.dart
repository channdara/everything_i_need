import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../../../data/repository/comment_repository_impl.dart';
import '../../../../data/response/post.dart';
import '../../../../domain/repository/comment_repository.dart';
import 'comment_bloc_state.dart';

class CommentBloc extends EinBaseBloc {
  final CommentRepository _commentRepository = CommentRepositoryImpl.instance;

  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  Future<void> fetchComment(Post post, [bool refresh = true]) async {
    final id = post.id;
    if (id == null) return;
    await execute(
      requesting: () async {
        final List<dynamic> items = [post];
        if (!refresh) startLoading();
        final response = await _commentRepository.comments(id);
        items.addAll(response);
        stopLoading();
        safeEmit(CommentStateGotComments(items));
      },
    );
  }
}
