import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({required super.title, super.id, required super.body});
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(title: json['title'], id: json['id'], body: json['body']);
  }
  Map<String, dynamic> tojson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
