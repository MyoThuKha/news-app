import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/saves_table.dart';
import 'package:news/features/saves/data/models/models.dart';

part 'saves_dao.g.dart';

@DriftAccessor(tables: [SavesTable])
class SavesDao extends DatabaseAccessor<AppDatabase> with _$SavesDaoMixin {
  SavesDao(super.db);

  Future<void> saveNews(SavesTableCompanion news) async {
    await into(savesTable).insertOnConflictUpdate(news);
  }

  Future<void> deleteNews(SavesTableCompanion news) {
    return delete(savesTable).delete(news);
  }


  Future<SavedNewsWithSource?> getSavedNewsByIdentifier(
    String identifier,
  ) async {
    final query =
        select(savesTable).join([
            innerJoin(newsTable, newsTable.url.equalsExp(savesTable.newsId)),
            leftOuterJoin(
              sourcesTable,
              sourcesTable.sourceId.equalsExp(newsTable.sourceId),
            ),
          ])
          ..where(savesTable.newsId.equals(identifier))
          ..orderBy([
            OrderingTerm(
              expression: savesTable.savedAt,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(1);

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    final saved = row.readTable(savesTable);
    final news = row.readTable(newsTable);
    final source = row.readTableOrNull(sourcesTable);

    return SavedNewsWithSource(
      news: news,
      source: source,
      savedAt: saved.savedAt,
    );
  }



  Stream<List<SavedNewsWithSource>> watchSavedNews() {
    final query =
        select(savesTable).join([
          innerJoin(newsTable, newsTable.url.equalsExp(savesTable.newsId)),
          leftOuterJoin(
            sourcesTable,
            sourcesTable.sourceId.equalsExp(newsTable.sourceId),
          ),
        ])..orderBy([
          OrderingTerm(expression: savesTable.savedAt, mode: OrderingMode.desc),
        ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final saved = row.readTable(savesTable);
        final news = row.readTable(newsTable);
        final source = row.readTableOrNull(sourcesTable);

        return SavedNewsWithSource(
          news: news,
          source: source,
          savedAt: saved.savedAt,
        );
      }).toList();
    });
  }
}
