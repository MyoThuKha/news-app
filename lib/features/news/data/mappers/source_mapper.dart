import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/data/models/source/source_model.dart';
import 'package:news/features/news/domain/entities/source/source_entity.dart';

extension SourceMapper on SourceModel {
  String get identifier {
    return id ??
        'gen_${name?.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '_')}';
  }

  SourceEntity toEntity() {
    return SourceEntity(id: id ?? '', name: name ?? '');
  }

  SourcesTableCompanion toTableCompanion() {
    return SourcesTableCompanion(
      sourceId: Value(identifier),
      name: Value(name ?? ''),
    );
  }

}
