import 'package:everything_i_need/everything_i_need.dart';

import '../../../../data/response/comment.dart';

class CommentStateGotComments extends EinBaseBlocState {
  CommentStateGotComments(this.comments);

  final List<Comment> comments;
}
