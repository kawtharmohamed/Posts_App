import 'package:equatable/equatable.dart';

import '../../../domain/entities/post.dart';

abstract class PostsState extends Equatable {
  PostsState();
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<Post> posts;
  LoadedPostsState({required this.posts});
  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends PostsState {
  final String message;

  ErrorPostsState({required this.message});
  @override
  List<Object> get props => [message];
}
