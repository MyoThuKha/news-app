import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/tables.dart';

part 'news_dao.g.dart';

@DriftAccessor(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  NewsDao(super.attachedDatabase);

  // MARK: News operations
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

  Stream<List<NewsTableData>> watchAllNews({int? limit}) {
    final query = select(newsTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
      ]);

    if (limit != null) query.limit(limit);
    return query.watch();
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

  // MARK: Sources operations
  Future<List<SourcesTableData>> getAllSources() {
    return (select(
      sourcesTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  Stream<List<SourcesTableData>> watchAllSources() {
    return (select(
      sourcesTable,
    )..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future<int> insertSource(SourcesTableCompanion source) async {
    return await into(sourcesTable).insertOnConflictUpdate(source);
  }

  Future<void> insertBulkSources(List<SourcesTableCompanion> sourcesList) async {
    await transaction(() async {
      for (final source in sourcesList) {
        await into(sourcesTable).insertOnConflictUpdate(source);
      }
    });
  }

  Future<void> clearAllSources() async {
    await delete(sourcesTable).go();
  }

}
