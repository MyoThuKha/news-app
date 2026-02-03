// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_dao.dart';

// ignore_for_file: type=lint
mixin _$SourcesDaoMixin on DatabaseAccessor<AppDatabase> {
  $SourcesTableTable get sourcesTable => attachedDatabase.sourcesTable;
  SourcesDaoManager get managers => SourcesDaoManager(this);
}

class SourcesDaoManager {
  final _$SourcesDaoMixin _db;
  SourcesDaoManager(this._db);
  $$SourcesTableTableTableManager get sourcesTable =>
      $$SourcesTableTableTableManager(_db.attachedDatabase, _db.sourcesTable);
}
