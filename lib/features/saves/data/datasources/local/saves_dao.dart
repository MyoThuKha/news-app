import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/tables.dart';

part 'saves_dao.g.dart';

@DriftAccessor(tables: [SavesTable])
class SavesDao extends DatabaseAccessor<AppDatabase> with _$SavesDaoMixin {
  SavesDao(super.attachedDatabase);

  // MARK: News operations
  Future<List<SavesTableData>> getAllSaves({int? limit}) {
    final query = select(savesTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.savedAt, mode: OrderingMode.desc),
      ]);

    if (limit != null) query.limit(limit);

    return query.get();
  }

  Stream<List<SavesTableData>> watchAllSaves({int? limit}) {
    final query = select(savesTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.savedAt, mode: OrderingMode.desc),
      ]);

    if (limit != null) query.limit(limit);
    return query.watch();
  }

  Future<void> insertSave(SavesTableData news) async {
    await into(savesTable).insertOnConflictUpdate(news);
  }

  Future<void> insertBulkSaves(List<SavesTableData> newsList) async {
    await transaction(() async {
      for (final news in newsList) {
        await into(savesTable).insertOnConflictUpdate(news);
      }
    });
  }

  Future<void> clearAllSaves() async {
    await delete(savesTable).go();
  }
}
