part of 'news_bloc.dart';

enum LoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}

class NewsState {
  final LoadingStatus status;
  final List<NewsEntity> news;

  NewsState({
    required this.status,
    required this.news,
  });

  NewsState.empty() : this(status: LoadingStatus.pure, news: []);

  NewsState copyWith({
    LoadingStatus? status,
    List<NewsEntity>? news,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsState &&
        other.status == status &&
        listEquals(other.news, news);
  }

  @override
  int get hashCode => status.hashCode ^ news.hashCode;
}
