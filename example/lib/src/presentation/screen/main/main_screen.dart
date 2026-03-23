import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

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
    bloc.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: RefreshIndicator.adaptive(
        onRefresh: () async => bloc.fetchPosts(),
        child: EinBlocBuilderWidget<MainStateGotPosts>(
          bloc: bloc,
          builder: (context, state) {
            return ListView.builder(
              padding: EinMediaQuery.paddingWithBottom(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = state.posts[index];
                return Card(
                  child: ListTile(
                    dense: true,
                    leading: CircleAvatar(child: Text('${item.userId}')),
                    title: Text(item.title ?? ''),
                    subtitle: Text(item.body ?? ''),
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
