import 'package:drift/drift.dart';
import 'package:news/config/database/tables/news_table.dart';

class SavesTable extends Table {
  TextColumn get newsId => text().references(NewsTable, #url)();
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {newsId};
}
