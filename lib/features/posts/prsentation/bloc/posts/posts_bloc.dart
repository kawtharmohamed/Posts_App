import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/strings/failures.dart';
import 'package:todo_app/features/posts/prsentation/bloc/posts/posts_event.dart';
import 'package:todo_app/features/posts/prsentation/bloc/posts/posts_state.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_posts.dart';
class PostsBloc extends Bloc<PostsEvent,PostsState> {
  final GetAllPostsUsecase getAllPosts;
  PostsBloc({ required this.getAllPosts} ) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts =await getAllPosts();
     emit(mapFailureOrPostsToState(failureOrPosts));

      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts =await getAllPosts();
        emit(mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }
  PostsState mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
          (failure) => ErrorPostsState(message: mapFailureToMessage(failure)),
          (posts) => LoadedPostsState(
        posts: posts,
      ),
    );
  }
  String mapFailureToMessage ( Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE ;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected error , please try again.";

    }

}
}
