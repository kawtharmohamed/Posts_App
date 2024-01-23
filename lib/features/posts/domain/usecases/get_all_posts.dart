import 'package:dartz/dartz.dart';
import 'package:todo_app/features/posts/domain/repositories/posts_repositories.dart';

import '../../../../core/error/failure.dart';
import '../entities/post.dart';

class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);
  Future<Either<Failure, List<Post>>> call() async{
   return await repository.getAllPosts();

  }
}