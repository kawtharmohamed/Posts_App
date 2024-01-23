import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/posts_repositories.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);
  Future<Either<Failure, Unit>> call( int postId) async{
    return await repository.deletePost(postId);

  }
}