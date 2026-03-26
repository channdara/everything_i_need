import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../../data/response/post.dart';
import '../../data/response/user.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    this.onTap,
    required this.post,
    this.user,
    this.padding,
  });

  final Post post;
  final User? user;
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
                CircleAvatar(child: Text('${user?.id ?? post.userId ?? ''}')),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.name ?? '', style: EinTextStyle.s14Bold),
                      Text(user?.email ?? '', style: EinTextStyle.s12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(post.title ?? '', style: EinTextStyle.s16Bold),
            const SizedBox(height: 8.0),
            Text(post.body ?? '', style: EinTextStyle.s14),
          ],
        ),
      ),
    );
  }
}
