import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../../data/response/comment.dart';
import '../../../data/response/post.dart';
import '../../../data/response/user.dart';
import '../../widget/comment_widget.dart';
import '../../widget/like_comment_share_widget.dart';
import '../../widget/post_widget.dart';
import 'bloc/comment_bloc.dart';
import 'bloc/comment_bloc_state.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.post, this.user});

  final Post post;
  final User? user;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends EinStateBaseBloc<CommentScreen, CommentBloc> {
  @override
  CommentBloc provideBloc() => CommentBloc();

  @override
  void initStatePostFrameCallback(Duration duration) {
    super.initStatePostFrameCallback(duration);
    bloc.fetchComment(widget.post, false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: RefreshIndicator.adaptive(
          onRefresh: () async => bloc.fetchComment(widget.post),
          child: EinBlocBuilderWidget<CommentStateGotComments>(
            bloc: bloc,
            builder: (context, state) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.items.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16.0);
                },
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  if (item is Post) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PostWidget(post: widget.post, user: widget.user),
                        LikeCommentShareWidget(
                          onLike: () {},
                          onComment: () {},
                          onShare: () {},
                        ),
                      ],
                    );
                  }
                  if (item is Comment) {
                    return CommentWidget(comment: item);
                  }
                  return const SizedBox();
                },
              );
            },
          ),
        ),
        bottomNavigationBar: Card(
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context).viewInsets.bottom +
                  EinMediaQuery.paddingBottom(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: bloc.commentController,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  hintText: 'Comment',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded),
                    iconSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
