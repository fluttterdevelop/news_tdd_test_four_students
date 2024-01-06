import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_tdd/features/news/data/models/news_article/news_article.dart';
import 'package:news_tdd/features/news/presentation/bloc/news_bloc/news_bloc.dart';

class NewsScreen extends StatelessWidget {
  final NewsArticleModel article;

  const NewsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return Text("News ${state.news}");
              },
            ),
          ),


          body: ListView(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).pushNamed('/news_single');
                },

                child: Image.network(
                  article.urlToImage, // Use the article's urlToImage property
                  width: double.maxFinite,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Text(article
                  .description), // Use the article's description property
              Text(article.content), // Use the article's content property
            ],
          ),
        );
      }
      
      ),
    );
  }
}