import 'package:drift/drift.dart';

class SourcesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sourceId => text().nullable()();
  TextColumn get name => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
