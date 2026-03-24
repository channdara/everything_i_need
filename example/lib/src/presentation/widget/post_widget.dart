import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../data/response/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, this.onTap, required this.post, this.padding});

  final Post post;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Text('${post.userId}')),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(post.title ?? '', style: EinTextStyle.s14Bold),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(post.body ?? '', style: EinTextStyle.s14),
          ],
        ),
      ),
    );
  }
}
