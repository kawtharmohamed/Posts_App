import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/posts/prsentation/pages/post_detail_page.dart';

import '../../../domain/entities/post.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListWidget({super.key, required this.posts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(posts[index].id.toString()),
              title: Text(
                posts[index].title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                posts[index].body,
                style: TextStyle(fontSize: 18),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostDetailPage(post: posts[index])));
              },
            );
          },
          itemCount: posts.length,
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
              )),
    );
  }
}
