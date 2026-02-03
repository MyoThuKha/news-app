import 'package:drift/drift.dart';
import 'package:news/config/database/tables/news_table.dart';

class SavesTable extends Table {
  TextColumn get newsId => text().references(NewsTable, #url).nullable()();
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();
}
