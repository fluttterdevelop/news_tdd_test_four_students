import 'package:flutter_test/flutter_test.dart';
import 'package:news_tdd/core/either/either.dart';
import 'package:news_tdd/core/exception/exception.dart';
import 'package:news_tdd/features/news/data/data_source/news_remote.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_tdd/features/news/data/models/get_news_response/get_news_response.dart';
import 'package:news_tdd/features/news/data/repository/news.dart';

class MockNewsRemoteDataSource extends Mock implements NewsRemoteDataSource {}

void main() {
  late MockNewsRemoteDataSource mockNewsRemoteDataSource;

  late NewsRepositoryImpl systemUnderTest;

  setUp(() {
    mockNewsRemoteDataSource = MockNewsRemoteDataSource();

    systemUnderTest = NewsRepositoryImpl(
      // remoteDataSource: mockNewsRemoteDataSource,
    );
  });

  group('NewsRepository', () {


  test(
      "Agar Data Sourcedan Model kelsa, Model tipi GetNewsResponseModel bo'lishi kerak",
      () async {
    when(() => mockNewsRemoteDataSource.getNews())
        .thenAnswer((_) async => GetNewsResponseModel.fromJson({}));
    final response = await mockNewsRemoteDataSource.getNews();

    expect(
      response,
      isA<Right>(),
    );
  });

  test("Agar Data Sourcedan ServerExeption  kelsa, Left tipi  qaytishi  kerak",
      () async {
    when(() => mockNewsRemoteDataSource.getNews()).thenAnswer(
      (_) async => await Future.error(
        const ServerException(errorMessage: '', errorCode: ''),
      ),
    );
    final response = await systemUnderTest.getNews();

    expect(
      response,
      isA<Left>(),
    );
  });

  test(
      "Remote Data Source ichidagi GetNews() metodi faqat 1 marta ishga tushishi  kerak",
      () async {
    when(() => mockNewsRemoteDataSource.getNews()).thenAnswer(
      (_) async => GetNewsResponseModel.fromJson({}),
    );
    await systemUnderTest.getNews();

    verify(() {
      mockNewsRemoteDataSource.getNews();
    }).called(1);
  });



  });



}
