import 'package:flutter/foundation.dart';

enum Category {
  all,
  learning,
  activities,
}

class BlogPostModel {
  final int id;
  final Category category;
  final String title;
  final String content;
  final String authorUrl;
  final String authorName;
  final bool isFeatured;

  BlogPostModel({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.content,
    @required this.authorUrl,
    @required this.authorName,
    this.isFeatured,
  })  : assert(id != null),
        assert(category != null),
        assert(title != null),
        assert(content != null);

  BlogPostModel.fromJson(Map<String, dynamic> json)
      : assert(json != null),
        this.id = json['id'],
        this.category = Category.values
            .firstWhere((e) => e.toString().split('.')[1] == json['category']),
        this.title = json['title'],
        this.content = json['content'],
        this.authorUrl = json['authorUrl'],
        this.authorName = json['authorName'],
        this.isFeatured = json['isFeatured'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'text': title,
      'content': content,
      'authorUrl': authorUrl,
      'authorName': authorName,
      'isFeatured': isFeatured,
    };
  }

  @override
  String toString() => '$title (id=$id)';
}
