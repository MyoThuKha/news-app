import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/config/database/tables/tables.dart';

part 'sources_dao.g.dart';

@DriftAccessor(tables: [SourcesTable])
class SourcesDao extends DatabaseAccessor<AppDatabase> with _$SourcesDaoMixin {
  SourcesDao(super.attachedDatabase);

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

  Future<void> insertBulkSources(
    List<SourcesTableCompanion> sourcesList,
  ) async {
    await transaction(() async {
      for (final source in sourcesList) {
        await into(sourcesTable).insertOnConflictUpdate(source);
      }
    });
  }

  Future<void> clearAllSources() async {
    await delete(sourcesTable).go();
  }

  Future<SourcesTableData?> getSourceById(int id) {
    return (select(
      sourcesTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<SourcesTableData?> watchSourceById(int id) {
    return (select(
      sourcesTable,
    )..where((t) => t.id.equals(id))).watchSingleOrNull();
  }
}
