import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/app_theme.dart';
import 'package:todo_app/features/posts/prsentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:todo_app/features/posts/prsentation/bloc/posts/posts_bloc.dart';
import 'package:todo_app/features/posts/prsentation/bloc/posts/posts_event.dart';
import 'package:todo_app/features/posts/prsentation/pages/posts_page.dart';
import 'injection_container.dart' as di; //dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdateBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Posts App',
        home: PostsPage(),
        theme: appTheme,
      ),
    );
  }
}
