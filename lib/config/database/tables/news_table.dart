import 'package:drift/drift.dart';
import 'package:news/config/database/tables/sources_table.dart';

class NewsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sourceId =>
      text().references(SourcesTable, #sourceId).nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
  TextColumn get publishedAt => text().nullable()();
  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
