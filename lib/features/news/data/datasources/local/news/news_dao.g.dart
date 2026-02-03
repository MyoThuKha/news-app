// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dao.dart';

// ignore_for_file: type=lint
mixin _$NewsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SourcesTableTable get sourcesTable => attachedDatabase.sourcesTable;
  $NewsTableTable get newsTable => attachedDatabase.newsTable;
  NewsDaoManager get managers => NewsDaoManager(this);
}

class NewsDaoManager {
  final _$NewsDaoMixin _db;
  NewsDaoManager(this._db);
  $$SourcesTableTableTableManager get sourcesTable =>
      $$SourcesTableTableTableManager(_db.attachedDatabase, _db.sourcesTable);
  $$NewsTableTableTableManager get newsTable =>
      $$NewsTableTableTableManager(_db.attachedDatabase, _db.newsTable);
}
