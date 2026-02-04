import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/tables.dart';
import 'package:news/features/news/data/models/models.dart';

part 'news_dao.g.dart';

@DriftAccessor(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  NewsDao(super.attachedDatabase);


  Stream<List<NewsWithSource>> watchAllFeaturedNews() {
    final baseQuery = select(newsTable)
      ..where((t) => t.isFeatured.equals(true))
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
      ]);

    final joined = baseQuery.join([
      leftOuterJoin(
        sourcesTable,
        sourcesTable.sourceId.equalsExp(newsTable.sourceId),
      ),
    ]);

    return joined.watch().map((rows) {
      return rows.map((row) {
        final news = row.readTable(newsTable);
        final source = row.readTableOrNull(sourcesTable);

        return NewsWithSource(news: news, source: source);
      }).toList();
    });
  }

  Stream<NewsWithSource?> watchFeaturedNews() {
    final baseQuery = select(newsTable)
      ..where((t) => t.isFeatured.equals(true))
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
      ])
      ..limit(1);
      

    final joined = baseQuery.join([
      leftOuterJoin(
        sourcesTable,
        sourcesTable.sourceId.equalsExp(newsTable.sourceId),
      ),
    ]);

    return joined.watchSingleOrNull().map((row) {
      if (row == null) return null;

      final news = row.readTable(newsTable);
      final source = row.readTableOrNull(sourcesTable);

      return NewsWithSource(news: news, source: source);
    });
  }


  Stream<NewsWithSource> watchNews({required String identifier}) {
    final baseQuery = select(newsTable)
      ..where((t) => t.url.equals(identifier))
      ..limit(1);

    final joined = baseQuery.join([
      leftOuterJoin(
        sourcesTable,
        sourcesTable.sourceId.equalsExp(newsTable.sourceId),
      ),
    ]);

    return joined.watchSingle().map((row) {
      final news = row.readTable(newsTable);
      final source = row.readTableOrNull(sourcesTable);

      return NewsWithSource(news: news, source: source);
    });
  }

  Stream<List<NewsWithSource>> watchAllNews({int? limit}) {
    final baseQuery = select(newsTable)
      ..where((t) => t.isFeatured.equals(false));

    final query =
        baseQuery.join([
          leftOuterJoin(
            sourcesTable,
            sourcesTable.sourceId.equalsExp(newsTable.sourceId),
          ),
        ])..orderBy([
          OrderingTerm(expression: newsTable.createdAt, mode: OrderingMode.asc),
        ]);

    if (limit != null) {
      query.limit(limit);
    }

    return query.watch().map((rows) {
      return rows.map((row) {
        final news = row.readTable(newsTable);
        final source = row.readTableOrNull(sourcesTable);

        return NewsWithSource(news: news, source: source);
      }).toList();
    });
  }

  Future<void> insertNews(NewsTableData news) async {
    await into(newsTable).insertOnConflictUpdate(news);
  }

  Future<void> insertBulkNews(List<NewsTableCompanion> newsList) async {
    await transaction(() async {
      for (final news in newsList) {
        await into(newsTable).insertOnConflictUpdate(news);
      }
    });
  }

  Future<void> clearAllNews() async {
    await delete(newsTable).go();
  }
}
