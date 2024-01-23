import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String title;
  final int? id;
  final String body;

  Post({required this.title, this.id, required this.body});

  @override
  List<Object?> get props => [id, title, body];
}
