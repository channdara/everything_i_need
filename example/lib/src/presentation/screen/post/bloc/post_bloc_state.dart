import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/response/post.dart';

class PostStateGotPosts extends EinBaseBlocState {
  PostStateGotPosts(this.posts);

  final List<Post> posts;
}
