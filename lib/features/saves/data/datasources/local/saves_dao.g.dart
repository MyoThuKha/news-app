// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saves_dao.dart';

// ignore_for_file: type=lint
mixin _$SavesDaoMixin on DatabaseAccessor<AppDatabase> {
  $SourcesTableTable get sourcesTable => attachedDatabase.sourcesTable;
  $NewsTableTable get newsTable => attachedDatabase.newsTable;
  $SavesTableTable get savesTable => attachedDatabase.savesTable;
  SavesDaoManager get managers => SavesDaoManager(this);
}

class SavesDaoManager {
  final _$SavesDaoMixin _db;
  SavesDaoManager(this._db);
  $$SourcesTableTableTableManager get sourcesTable =>
      $$SourcesTableTableTableManager(_db.attachedDatabase, _db.sourcesTable);
  $$NewsTableTableTableManager get newsTable =>
      $$NewsTableTableTableManager(_db.attachedDatabase, _db.newsTable);
  $$SavesTableTableTableManager get savesTable =>
      $$SavesTableTableTableManager(_db.attachedDatabase, _db.savesTable);
}
