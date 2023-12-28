import 'package:json_annotation/json_annotation.dart';
import 'package:news_tdd/features/news/domain/entites/news.dart';

part 'news_article.g.dart';

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.none,
  includeIfNull: true,
)
class NewsArticleModel extends NewsEntity {
  NewsArticleModel({
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> data) =>
      _$NewsArticleModelFromJson(data);
}
