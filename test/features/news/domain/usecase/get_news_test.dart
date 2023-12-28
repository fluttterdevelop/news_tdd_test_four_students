import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_tdd/core/either/either.dart';
import 'package:news_tdd/core/failure/failure.dart';
import 'package:news_tdd/core/usecase/usecase.dart';
import 'package:news_tdd/features/news/domain/repositories/news.dart';
import 'package:news_tdd/features/news/domain/usecases/get_news.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late MockNewsRepository mockNewsRepository;
  late GetNewsUseCase systemUnderTest;

  setUp(() {
    mockNewsRepository = MockNewsRepository();

    systemUnderTest = GetNewsUseCase(mockNewsRepository);
  });

  group('GetNewsUseCase', () {



  test(
      'Agar Repository Right qiymat qaytarsa  Usecase ham Right qaytarishi  kerak ',
      () async {
    when(() => mockNewsRepository.getNews()).thenAnswer((_) async => Right([]));

    final usecase = await systemUnderTest.call(NoParams());

    expect(usecase, isA<Right>());
  });

  test(
      'Agar Repository Left  qiymat qaytarsa  Usecase ham Left qaytarishi  kerak ',
      () async {
    when(() => mockNewsRepository.getNews()).thenAnswer(
        (_) async => Left(ServerFailure(failureMessage: '', failureCode: '')));

    final usecase = await systemUnderTest.call(NoParams());

    expect(usecase, isA<Left>());
  });

  test(
      'Usecase  ichidagi mockNewsRepository.getNews() metodi 1 marta chaqirilishi   kerak !!!',
      () async {
    when(() => mockNewsRepository.getNews()).thenAnswer(
        (_) async => Left(ServerFailure(failureMessage: '', failureCode: '')));

    await systemUnderTest.call(NoParams());

    verify(() {
      mockNewsRepository.getNews();
    }).called(1);
  });


  });


}
