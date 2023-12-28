import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_tdd/features/news/presentation/bloc/news_bloc/news_bloc.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

void main() {
  late MockNewsBloc mockNewsBloc;

  setUp(() {
    final bloc = MockNewsBloc;
  });

  var bloc;
  blocTest<NewsBloc, NewsState>(
      // act: deganini ichida biz event chaqiramiz
      // errors: addErrors yozsak chiqadi
      // verify: oxirgi natijani tekshirish uchun
      // 'emits [MyState] when MyEvent is adde.',
      // act: (bloc) => bloc.add(MyEvent),

      "Boshlang'ich State qiymatlari  bo'sh bo'lishi kerak ",
      build: () => bloc,
      expect: () {
        var bloc;
        expect(bloc.state, NewsState.empty());
      });
}