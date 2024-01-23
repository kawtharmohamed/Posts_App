import 'package:dartz/dartz.dart';
import 'package:todo_app/core/strings/messages.dart';
import 'package:todo_app/features/posts/prsentation/bloc/add_delete_update_post/add_delete_update_post_event.dart';
import 'package:todo_app/features/posts/prsentation/bloc/add_delete_update_post/add_delete_update_post_state.dart';
import 'package:bloc/bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/usecases/add_post.dart';
import '../../../domain/usecases/delete_post.dart';
import '../../../domain/usecases/update_post.dart';

class AddDeleteUpdateBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUsecase addPost;
  final DeletePostUsecase deletePost;
  final UpdatePostUsecase updatePost;

  AddDeleteUpdateBloc(
      {required this.addPost,
      required this.deletePost,
      required this.updatePost})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await addPost(event.post);
        emit(eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await deletePost(event.postId);
        emit(eitherDoneMessageOrErrorState(
            failureOrDoneMessage, DELETE_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());
        final failureOrDoneMessage = await updatePost(event.post);
        emit(eitherDoneMessageOrErrorState(
            failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
      }
    });
  }
  AddDeleteUpdatePostState eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteUpdatePostState(
        message: mapFailureToMessage(failure),
      ),
      (_) => MessageAddDeleteUpdatePostState(message: message),
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected error , please try again.";
    }
  }
}
