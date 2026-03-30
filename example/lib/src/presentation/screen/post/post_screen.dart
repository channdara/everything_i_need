import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../widget/post_widget.dart';
import '../comment/comment_screen.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_bloc_state.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends EinStateBaseBloc<PostScreen, PostBloc> {
  @override
  PostBloc provideBloc() => PostBloc();

  @override
  void initStatePostFrameCallback(Duration duration) {
    super.initStatePostFrameCallback(duration);
    bloc.fetchPosts(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: RefreshIndicator.adaptive(
        onRefresh: bloc.fetchPosts,
        child: EinBlocBuilderWidget<PostStateGotPosts>(
          bloc: bloc,
          builder: (context, state) {
            return ListView.separated(
              padding: EinMediaQuery.paddingWithBottom(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.posts.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (context, index) {
                final post = state.posts[index];
                final user = bloc.getUser(post.userId);
                return Card(
                  child: PostWidget(
                    onTap: () {
                      context.push(CommentScreen(post: post, user: user));
                    },
                    post: post,
                    user: user,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
