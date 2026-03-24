import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../data/response/comment.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(child: Text('${comment.id}')),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.name ?? '', style: EinTextStyle.s14Bold),
                  Text(comment.email ?? '', style: EinTextStyle.s12),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Text(comment.body ?? '', style: EinTextStyle.s14),
      ],
    );
  }
}
