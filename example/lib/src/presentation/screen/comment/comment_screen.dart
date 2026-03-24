import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../../data/response/post.dart';
import '../../widget/comment_widget.dart';
import '../../widget/post_widget.dart';
import 'bloc/comment_bloc.dart';
import 'bloc/comment_bloc_state.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.post});

  final Post post;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends EinStateBaseBloc<CommentScreen, CommentBloc> {
  @override
  CommentBloc provideBloc() => CommentBloc();

  @override
  void initStatePostFrameCallback(Duration duration) {
    super.initStatePostFrameCallback(duration);
    bloc.fetchComment(widget.post.id, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Column(
        children: [
          PostWidget(post: widget.post),
          const Divider(indent: 16.0, endIndent: 16.0, height: 32.0),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => bloc.fetchComment(widget.post.id),
              child: EinBlocBuilderWidget<CommentStateGotComments>(
                bloc: bloc,
                builder: (context, state) {
                  return ListView.separated(
                    padding: EinMediaQuery.paddingWithBottom(),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.comments.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 32.0);
                    },
                    itemBuilder: (context, index) {
                      final comment = state.comments[index];
                      return CommentWidget(comment: comment);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
