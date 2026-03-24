import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../widget/post_widget.dart';
import '../comment/comment_screen.dart';
import 'bloc/main_bloc.dart';
import 'bloc/main_bloc_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends EinStateBaseBloc<MainScreen, MainBloc> {
  @override
  MainBloc provideBloc() => MainBloc();

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
        child: EinBlocBuilderWidget<MainStateGotPosts>(
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
                return Card(
                  child: PostWidget(
                    onTap: () {
                      context.push(CommentScreen(post: post));
                    },
                    post: post,
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
