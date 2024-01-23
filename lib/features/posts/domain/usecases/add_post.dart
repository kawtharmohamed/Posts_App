import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/posts/domain/entities/post.dart';
import 'package:todo_app/features/posts/domain/repositories/posts_repositories.dart';

class AddPostUsecase{
  final PostsRepository repository;
  AddPostUsecase(this.repository);
  Future<Either<Failure, Unit>> call( Post post) async{
    return await repository.addPost(post);
  }
}