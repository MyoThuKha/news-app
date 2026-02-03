import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/data/mappers/mappers.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/entities.dart';

void main() {
  group('Testing Model -> Entity Mapper on NewsModel', () {
    final json = jsonDecode(File('test/data/news.json').readAsStringSync());
    final List<NewsModel> newsModels = (json as List)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final newsEntities = newsModels.map((e)=> e.toEntity()).toList();

    test('Length Check', () {
      expect(newsModels.length, newsEntities.length);
    });

    test('Data validation', () {
      for (int i = 0; i < newsEntities.length; i++) {
        expect(newsEntities[i], entities[i]);
      }
    });
  });
}

const List<NewsEntity> entities = [
  NewsEntity(
    source: SourceEntity(id: '', name: 'CoinDesk'),
    author: 'Sam Reynolds',
    title:
        'Bitcoin holds below \$80,000 as January prediction contracts miss liquidation-driven slide: Asia Morning Briefing - CoinDesk',
    description:
        'Options markets signaled rising tail risk as liquidations mounted, but January prediction odds adjusted slowly as bitcoin volatility unfolded.',
    url:
        'https://www.coindesk.com/markets/2026/02/02/bitcoin-holds-below-usd80-000-as-january-prediction-contracts-miss-liquidation-driven-slide-asia-morning-briefing',
    urlToImage:
        'https://cdn.sanity.io/images/s3y3vcno/production/192d0e325507d6f5a46471e5eddb27d992835f1e-1919x1080.jpg?auto=format&w=960&h=540&crop=focalpoint&fit=clip&q=75&fm=jpg',
    publishedAt: '2026-02-02T02:38:58Z',
    content:
        "Welcome to Asia Morning Briefing, a daily summary of top stories during U.S. hours and an overview of market moves and analysis. For a detailed overview of U.S. markets, see CoinDesk's Crypto Daybook… [+3725 chars]",
  ),
  NewsEntity(
    source: SourceEntity(
      id: 'the-washington-post',
      name: 'The Washington Post',
    ),
    author: 'Matt Viser',
    title:
        'Trump family crypto firm sold major stake to UAE investment firm - The Washington Post',
    description:
        'The investment, worth a reported \$500 million, gave Emirati-backed investors a 49 percent stake in World Liberty Financial, a Trump crypto company.',
    url:
        'https://www.washingtonpost.com/politics/2026/02/01/trump-uae-crypto-world-liberty-financial/',
    urlToImage:
        'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/EGKGACNKZLMUM7MHLLWYITJ7PM.jpg&w=1440',
    publishedAt: '2026-02-02T02:35:36Z',
    content:
        'The investment, worth a reported \$500 million, gave Emirati-backed investors a 49 percent stake in World Liberty Financial, a Trump crypto company.\r\nFebruary 1, 2026 at 8:04 p.m. EST39 minutes ago',
  ),
];
