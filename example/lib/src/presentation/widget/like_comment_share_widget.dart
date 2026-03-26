import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

class LikeCommentShareWidget extends StatelessWidget {
  const LikeCommentShareWidget({
    super.key,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onLike,
                borderRadius: BorderRadius.circular(12.0),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up_rounded),
                      SizedBox(width: 8.0),
                      Text('Like', style: EinTextStyle.s16),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onComment,
                borderRadius: BorderRadius.circular(12.0),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.comment_rounded),
                      SizedBox(width: 8.0),
                      Text('Comment', style: EinTextStyle.s16),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onShare,
                borderRadius: BorderRadius.circular(12.0),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share_rounded),
                      SizedBox(width: 8.0),
                      Text('Share', style: EinTextStyle.s16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
