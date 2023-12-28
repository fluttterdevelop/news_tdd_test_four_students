import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entites/news.dart';

abstract class NewsRepository {
  Future<Either<ServerFailure, List<NewsEntity>>> getNews();
}
