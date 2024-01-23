import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable{
  PostsEvent();
  @override
  List<Object> get props => [];
}
class GetAllPostsEvent extends PostsEvent{}

class RefreshPostsEvent extends PostsEvent{}