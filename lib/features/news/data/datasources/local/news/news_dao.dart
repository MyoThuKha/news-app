import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/tables.dart';
import 'package:news/features/news/data/models/models.dart';

part 'news_dao.g.dart';

@DriftAccessor(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  NewsDao(super.attachedDatabase);

  Future<List<NewsTableData>> getAllNews({int? limit}) {
    final query = select(newsTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
      ]);

    if (limit != null) query.limit(limit);

    return query.get();
  }

  Stream<NewsTableData> watchNews({required String idendifier}) {
    final query = select(newsTable)
      ..where((t) => t.url.equals(idendifier))
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
      ])
      ..limit(1);

    return query.watchSingle();
  }

  Stream<NewsWithSource> watchNewsWithSource({required String identifier}) {
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
    final query =
        select(newsTable).join([
          leftOuterJoin(
            sourcesTable,
            sourcesTable.sourceId.equalsExp(newsTable.sourceId),
          ),
        ])..orderBy([
          OrderingTerm(
            expression: newsTable.publishedAt,
            mode: OrderingMode.desc,
          ),
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
