import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_tdd/core/usecase/usecase.dart';
import 'package:news_tdd/features/news/data/repository/news.dart';
import 'package:news_tdd/features/news/domain/entites/news.dart';
import 'package:flutter/foundation.dart';
import 'package:news_tdd/features/news/domain/usecases/get_news.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState.empty()) {
    on<NewsStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final usecase =
          await GetNewsUseCase(NewsRepositoryImpl()).call(NoParams());

      usecase.either(
        (failure) {
          emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        },
        (news) {
          emit(state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            news: news,
          ));
        },
      );
    });
  }
}
