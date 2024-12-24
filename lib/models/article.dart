import 'package:test_flutter/models/user.dart';

class Article {
  //コンストラクタ
  Article({
    required this.title,
    required this.user,
    this.linkesCount = 0, //デフォルトで0
    this.tags = const [], //デフォルトでから配列で設定
    required this.createdAt,
    required this.url,
  });

  final String title;
  final User user;
  final int linkesCount;
  final List<String> tags;
  final DateTime createdAt;
  final String url;

  //JSONからArticleを生成するファクトリコンストラクタ
  //JSONのデータからArticleオブジェクトを生成するために使う
  factory Article.fromJson(dynamic json) {
    return Article(
      title: json['title'] as String,
      user: User.fromJson(json['user']),
      url: json['url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      linkesCount: json['likes_count'] as int,
      //jsonの中のtagsに含まれる文字列のリストから、map処理で一つずつそのnameを取り出してStringの配列にしていく
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])),
    );
  }
}
