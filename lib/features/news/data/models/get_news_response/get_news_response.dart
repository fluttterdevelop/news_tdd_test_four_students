import 'package:json_annotation/json_annotation.dart';

import '../news_article/news_article.dart';

part 'get_news_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, createToJson: false)
class GetNewsResponseModel {
  final String status;
  final int totalResults;
  final List<NewsArticleModel> articles;

  GetNewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory GetNewsResponseModel.fromJson(Map<String, dynamic> data) =>
      _$GetNewsResponseModelFromJson(data);
}
