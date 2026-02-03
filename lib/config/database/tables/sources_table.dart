import 'package:drift/drift.dart';

class SourcesTable extends Table {
  TextColumn get sourceId => text().nullable()();
  TextColumn get name => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {sourceId};
}
