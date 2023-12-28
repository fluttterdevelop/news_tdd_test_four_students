import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_tdd/main.dart';

void main() {
  testWidgets("NewsPage ichida kamida 1 Scaffold bo'lishi kerak", (test) async {
    await test.pump(Durations.extralong1);
    await test.pumpWidget(const MainApp());

    expect(find.byType(Scaffold), findsOne);
  });


 testWidgets("NewsPage ichida kamida 1 Scaffold bo'lishi kerak", (test) async {
    await test.pump(Durations.extralong1);
    await test.pumpWidget(const MainApp());

    expect(find.byType(Text), findsExactly(1));
  });


}
