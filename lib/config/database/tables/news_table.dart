import 'package:drift/drift.dart';
import 'package:news/config/database/tables/sources_table.dart';

class NewsTable extends Table {
  TextColumn get sourceId =>
      text().references(SourcesTable, #sourceId).nullable()();
  TextColumn get author => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  TextColumn get content => text().nullable()();

  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {url};
}
