import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/network/network_info.dart';
import 'package:todo_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:todo_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:todo_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:todo_app/features/posts/domain/repositories/posts_repositories.dart';
import 'package:todo_app/features/posts/domain/usecases/add_post.dart';
import 'package:todo_app/features/posts/domain/usecases/delete_post.dart';
import 'package:todo_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:todo_app/features/posts/domain/usecases/update_post.dart';
import 'package:todo_app/features/posts/prsentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:todo_app/features/posts/prsentation/bloc/posts/posts_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features/posts
//Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() =>
      AddDeleteUpdateBloc(addPost: sl(), deletePost: sl(), updatePost: sl()));
//Usecases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
//Repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfow: sl()));
//Datasource
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
