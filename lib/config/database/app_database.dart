import 'package:drift/drift.dart';
import 'package:news/config/database/tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [NewsTable, SourcesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}



