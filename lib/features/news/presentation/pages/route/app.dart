import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_tdd/features/news/data/models/news_article/news_article.dart';
import 'package:news_tdd/features/news/presentation/pages/product.dart';
import 'package:news_tdd/features/news/presentation/pages/single.dart';
import 'package:news_tdd/features/news/presentation/pages/splash.dart';

abstract class AppRoute {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case "/news":
        final arguments = settings.arguments;
        final article = arguments as NewsArticleModel;
        return CupertinoPageRoute(
          builder: (_) => NewsScreen(
            article: article,
          ),
        );
      case '/news_single':
        return CupertinoPageRoute(builder: (_) => SingleScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const Scaffold());
    }
  }
}
