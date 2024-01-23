import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/posts/prsentation/pages/add_update_post_page.dart';
import 'package:todo_app/features/posts/prsentation/widgets/post_detail_page/delete_post_btn_widget.dart';
import 'package:todo_app/features/posts/prsentation/widgets/post_detail_page/update_post_btn_widget.dart';

import '../../../domain/entities/post.dart';

class PostDetailWidget extends StatelessWidget{
  final Post post;

  const PostDetailWidget({super.key, required this.post });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Text(post.title , style:  TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
        Divider(height: 50,),
        Text(post.body , style:  TextStyle(fontSize: 16),),
        Divider(height: 50,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           UpdatePostBtnWidget(post: post),
            DeletePostBtnWidget(postId: post.id!) ,
          ],)
      ],),
    );
  }

}