import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/data/models/news/news_model.dart';

void main() {
  group('Testing NewsModel Conversion from Json', () {
    final json = jsonDecode(File('test/data/news.json').readAsStringSync());

    final List<NewsModel> newsModels = (json as List)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();

    test('Length Check', () {
      expect(newsModels.length, 2);
    });

    test('To Json', () {
      expect(newsModels.map((e) => e.toJson()).toList(), json);
    });

    test('Sources Data Check', () {
      expect(newsModels.map((e) => e.source.name), [
        'CoinDesk',
        'The Washington Post',
      ]);

      expect(newsModels.map((e) => e.source.id), [null, 'the-washington-post']);
    });
  });
}
