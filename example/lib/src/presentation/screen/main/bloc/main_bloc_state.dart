import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/response/post.dart';

class MainStateGotPosts extends EinBaseBlocState {
  MainStateGotPosts(this.posts);

  final List<Post> posts;
}
