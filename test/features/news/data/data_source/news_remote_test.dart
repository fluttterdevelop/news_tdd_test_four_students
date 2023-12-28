import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:news_tdd/features/news/data/data_source/news_remote.dart';

import 'package:news_tdd/features/news/data/models/get_news_response/get_news_response.dart';

//  mok bilan dioni ishlatib bo'lmaydi
// buning uchun bizga http_mock_adapter package kerak bo'ladi

void main() {
  // TODO 1:o'zgaruvchilarni yaratish
  final dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2'));

  final dioAdapter = DioAdapter(dio: dio);

  late NewsRemoteDataSource systemUnderTest;

  late DioError dioError;

// TODO 2  o'zgaruvchilarga Setup() ichida qiymat berish
  setUp(() {
    systemUnderTest = NewsRemoteDataSource(dioAdapter.dio);

    dioError = DioError(
      requestOptions: RequestOptions(baseUrl: 'https://newsapi.org/v2'),
    );
  });

// TODO 3: test yoki group test yozish

  group(
    'NewsRemoteDataSource',
    () {
//  barcha testlarimizni group ichiga olamiz




      //1  bu kod ustozda ishladi menda ishlamadi
      test(
        "serverdan ma'lumot 200 status kod bilan kelganda, model qaytarish !!! ",
        () async {
          dioAdapter.onGet(
            '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
            (server) => server.reply(
              200,
              {
                'message': 'Success!',
              },
              delay: const Duration(seconds: 1),
            ),
          );
          final response = await systemUnderTest.getNews();
          // testimiz tugagan paytda type GetNewsResponseModel bo'lishi kerak
          expect(response, isA<GetNewsResponseModel>());
        },
      );

// 2 error kelganda testlash uchun
      test(
          "serverdan ma'lumot 400 status kod bilan kelganda, ServerExeption qaytarish !!! ",
          () async {
        dioAdapter.onGet(
          '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
          (server) => server.throws(
            400,
           dioError,
            delay: const Duration(seconds: 1),
          ),
        );

        final response = await systemUnderTest.getNews();

        expect(response, throwsA(isA()));
      });


// 3 test
      test(
        'dio get requesti faqat bir marta chaqirildi !!!',
        () async {
          dioAdapter.onGet(
            '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
            (server) => server.reply(
              200,
              {
                'message': 'Success!',
              },
              delay: const Duration(seconds: 1),
            ),
          );

          await systemUnderTest.getNews();

          //  bu faqat bir marta ishlashi uchun kerak bo'ladi
          verify(
            () {
              dio.get(
                '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
              );
            },
          ).called(1);
        },
      );
    },
  );
}


