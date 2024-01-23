import 'package:flutter/material.dart';
import 'package:todo_app/features/posts/prsentation/pages/add_update_post_page.dart';

import '../../../domain/entities/post.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostAddUpdatePage(
                isUpdatePost: true,
                post: post,
              ),
            ));
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}