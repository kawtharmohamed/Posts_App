import 'package:equatable/equatable.dart';
import 'package:todo_app/features/posts/domain/entities/post.dart';

abstract class AddDeleteUpdatePostEvent extends Equatable {
  AddDeleteUpdatePostEvent();
  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final Post post;

  AddPostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final Post post;

  UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}
