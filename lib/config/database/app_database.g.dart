// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SourcesTableTable extends SourcesTable
    with TableInfo<$SourcesTableTable, SourcesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [sourceId, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourcesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sourceId};
  @override
  SourcesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourcesTableData(
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $SourcesTableTable createAlias(String alias) {
    return $SourcesTableTable(attachedDatabase, alias);
  }
}

class SourcesTableData extends DataClass
    implements Insertable<SourcesTableData> {
  final String? sourceId;
  final String? name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const SourcesTableData({
    this.sourceId,
    this.name,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  SourcesTableCompanion toCompanion(bool nullToAbsent) {
    return SourcesTableCompanion(
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SourcesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourcesTableData(
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      name: serializer.fromJson<String?>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<String?>(sourceId),
      'name': serializer.toJson<String?>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  SourcesTableData copyWith({
    Value<String?> sourceId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => SourcesTableData(
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    name: name.present ? name.value : this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  SourcesTableData copyWithCompanion(SourcesTableCompanion data) {
    return SourcesTableData(
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourcesTableData(')
          ..write('sourceId: $sourceId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sourceId, name, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourcesTableData &&
          other.sourceId == this.sourceId &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SourcesTableCompanion extends UpdateCompanion<SourcesTableData> {
  final Value<String?> sourceId;
  final Value<String?> name;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const SourcesTableCompanion({
    this.sourceId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesTableCompanion.insert({
    this.sourceId = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<SourcesTableData> custom({
    Expression<String>? sourceId,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesTableCompanion copyWith({
    Value<String?>? sourceId,
    Value<String?>? name,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return SourcesTableCompanion(
      sourceId: sourceId ?? this.sourceId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesTableCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sources_table (source_id)',
    ),
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlToImageMeta = const VerificationMeta(
    'urlToImage',
  );
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
    'url_to_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFeaturedMeta = const VerificationMeta(
    'isFeatured',
  );
  @override
  late final GeneratedColumn<bool> isFeatured = GeneratedColumn<bool>(
    'is_featured',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_featured" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sourceId,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
    isFeatured,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NewsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
        _urlToImageMeta,
        urlToImage.isAcceptableOrUnknown(
          data['url_to_image']!,
          _urlToImageMeta,
        ),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('is_featured')) {
      context.handle(
        _isFeaturedMeta,
        isFeatured.isAcceptableOrUnknown(data['is_featured']!, _isFeaturedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  NewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsTableData(
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      urlToImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_to_image'],
      ),
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      isFeatured: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_featured'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }
}

class NewsTableData extends DataClass implements Insertable<NewsTableData> {
  final String? sourceId;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const NewsTableData({
    this.sourceId,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    required this.isFeatured,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['is_featured'] = Variable<bool>(isFeatured);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      isFeatured: Value(isFeatured),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory NewsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsTableData(
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      author: serializer.fromJson<String?>(json['author']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      url: serializer.fromJson<String?>(json['url']),
      urlToImage: serializer.fromJson<String?>(json['urlToImage']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      content: serializer.fromJson<String?>(json['content']),
      isFeatured: serializer.fromJson<bool>(json['isFeatured']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<String?>(sourceId),
      'author': serializer.toJson<String?>(author),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'url': serializer.toJson<String?>(url),
      'urlToImage': serializer.toJson<String?>(urlToImage),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'content': serializer.toJson<String?>(content),
      'isFeatured': serializer.toJson<bool>(isFeatured),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  NewsTableData copyWith({
    Value<String?> sourceId = const Value.absent(),
    Value<String?> author = const Value.absent(),
    Value<String?> title = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> urlToImage = const Value.absent(),
    Value<DateTime?> publishedAt = const Value.absent(),
    Value<String?> content = const Value.absent(),
    bool? isFeatured,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => NewsTableData(
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    author: author.present ? author.value : this.author,
    title: title.present ? title.value : this.title,
    description: description.present ? description.value : this.description,
    url: url.present ? url.value : this.url,
    urlToImage: urlToImage.present ? urlToImage.value : this.urlToImage,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    content: content.present ? content.value : this.content,
    isFeatured: isFeatured ?? this.isFeatured,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  NewsTableData copyWithCompanion(NewsTableCompanion data) {
    return NewsTableData(
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      author: data.author.present ? data.author.value : this.author,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      url: data.url.present ? data.url.value : this.url,
      urlToImage: data.urlToImage.present
          ? data.urlToImage.value
          : this.urlToImage,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      content: data.content.present ? data.content.value : this.content,
      isFeatured: data.isFeatured.present
          ? data.isFeatured.value
          : this.isFeatured,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableData(')
          ..write('sourceId: $sourceId, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('isFeatured: $isFeatured, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sourceId,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
    isFeatured,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsTableData &&
          other.sourceId == this.sourceId &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content &&
          other.isFeatured == this.isFeatured &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NewsTableCompanion extends UpdateCompanion<NewsTableData> {
  final Value<String?> sourceId;
  final Value<String?> author;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> url;
  final Value<String?> urlToImage;
  final Value<DateTime?> publishedAt;
  final Value<String?> content;
  final Value<bool> isFeatured;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const NewsTableCompanion({
    this.sourceId = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsTableCompanion.insert({
    this.sourceId = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.isFeatured = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<NewsTableData> custom({
    Expression<String>? sourceId,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<DateTime>? publishedAt,
    Expression<String>? content,
    Expression<bool>? isFeatured,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
      if (isFeatured != null) 'is_featured': isFeatured,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsTableCompanion copyWith({
    Value<String?>? sourceId,
    Value<String?>? author,
    Value<String?>? title,
    Value<String?>? description,
    Value<String?>? url,
    Value<String?>? urlToImage,
    Value<DateTime?>? publishedAt,
    Value<String?>? content,
    Value<bool>? isFeatured,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return NewsTableCompanion(
      sourceId: sourceId ?? this.sourceId,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      isFeatured: isFeatured ?? this.isFeatured,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (isFeatured.present) {
      map['is_featured'] = Variable<bool>(isFeatured.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('isFeatured: $isFeatured, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavesTableTable extends SavesTable
    with TableInfo<$SavesTableTable, SavesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
    'news_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES news_table (url)',
    ),
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [newsId, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saves_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('news_id')) {
      context.handle(
        _newsIdMeta,
        newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {newsId};
  @override
  SavesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavesTableData(
      newsId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}news_id'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $SavesTableTable createAlias(String alias) {
    return $SavesTableTable(attachedDatabase, alias);
  }
}

class SavesTableData extends DataClass implements Insertable<SavesTableData> {
  final String newsId;
  final DateTime savedAt;
  const SavesTableData({required this.newsId, required this.savedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['news_id'] = Variable<String>(newsId);
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  SavesTableCompanion toCompanion(bool nullToAbsent) {
    return SavesTableCompanion(newsId: Value(newsId), savedAt: Value(savedAt));
  }

  factory SavesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavesTableData(
      newsId: serializer.fromJson<String>(json['newsId']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'newsId': serializer.toJson<String>(newsId),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  SavesTableData copyWith({String? newsId, DateTime? savedAt}) =>
      SavesTableData(
        newsId: newsId ?? this.newsId,
        savedAt: savedAt ?? this.savedAt,
      );
  SavesTableData copyWithCompanion(SavesTableCompanion data) {
    return SavesTableData(
      newsId: data.newsId.present ? data.newsId.value : this.newsId,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavesTableData(')
          ..write('newsId: $newsId, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(newsId, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavesTableData &&
          other.newsId == this.newsId &&
          other.savedAt == this.savedAt);
}

class SavesTableCompanion extends UpdateCompanion<SavesTableData> {
  final Value<String> newsId;
  final Value<DateTime> savedAt;
  final Value<int> rowid;
  const SavesTableCompanion({
    this.newsId = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavesTableCompanion.insert({
    required String newsId,
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : newsId = Value(newsId);
  static Insertable<SavesTableData> custom({
    Expression<String>? newsId,
    Expression<DateTime>? savedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (newsId != null) 'news_id': newsId,
      if (savedAt != null) 'saved_at': savedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavesTableCompanion copyWith({
    Value<String>? newsId,
    Value<DateTime>? savedAt,
    Value<int>? rowid,
  }) {
    return SavesTableCompanion(
      newsId: newsId ?? this.newsId,
      savedAt: savedAt ?? this.savedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavesTableCompanion(')
          ..write('newsId: $newsId, ')
          ..write('savedAt: $savedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SourcesTableTable sourcesTable = $SourcesTableTable(this);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  late final $SavesTableTable savesTable = $SavesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sourcesTable,
    newsTable,
    savesTable,
  ];
}

typedef $$SourcesTableTableCreateCompanionBuilder =
    SourcesTableCompanion Function({
      Value<String?> sourceId,
      Value<String?> name,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$SourcesTableTableUpdateCompanionBuilder =
    SourcesTableCompanion Function({
      Value<String?> sourceId,
      Value<String?> name,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$SourcesTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SourcesTableTable, SourcesTableData> {
  $$SourcesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NewsTableTable, List<NewsTableData>>
  _newsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.newsTable,
    aliasName: $_aliasNameGenerator(
      db.sourcesTable.sourceId,
      db.newsTable.sourceId,
    ),
  );

  $$NewsTableTableProcessedTableManager get newsTableRefs {
    final manager = $$NewsTableTableTableManager($_db, $_db.newsTable).filter(
      (f) => f.sourceId.sourceId.sqlEquals($_itemColumn<String>('source_id')),
    );

    final cache = $_typedResult.readTableOrNull(_newsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourcesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SourcesTableTable> {
  $$SourcesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> newsTableRefs(
    Expression<bool> Function($$NewsTableTableFilterComposer f) f,
  ) {
    final $$NewsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.newsTable,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsTableTableFilterComposer(
            $db: $db,
            $table: $db.newsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourcesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SourcesTableTable> {
  $$SourcesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourcesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourcesTableTable> {
  $$SourcesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> newsTableRefs<T extends Object>(
    Expression<T> Function($$NewsTableTableAnnotationComposer a) f,
  ) {
    final $$NewsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.newsTable,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.newsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourcesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourcesTableTable,
          SourcesTableData,
          $$SourcesTableTableFilterComposer,
          $$SourcesTableTableOrderingComposer,
          $$SourcesTableTableAnnotationComposer,
          $$SourcesTableTableCreateCompanionBuilder,
          $$SourcesTableTableUpdateCompanionBuilder,
          (SourcesTableData, $$SourcesTableTableReferences),
          SourcesTableData,
          PrefetchHooks Function({bool newsTableRefs})
        > {
  $$SourcesTableTableTableManager(_$AppDatabase db, $SourcesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourcesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourcesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourcesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String?> sourceId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesTableCompanion(
                sourceId: sourceId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String?> sourceId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesTableCompanion.insert(
                sourceId: sourceId,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SourcesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({newsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (newsTableRefs) db.newsTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (newsTableRefs)
                    await $_getPrefetchedData<
                      SourcesTableData,
                      $SourcesTableTable,
                      NewsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SourcesTableTableReferences
                          ._newsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SourcesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).newsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sourceId == item.sourceId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourcesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourcesTableTable,
      SourcesTableData,
      $$SourcesTableTableFilterComposer,
      $$SourcesTableTableOrderingComposer,
      $$SourcesTableTableAnnotationComposer,
      $$SourcesTableTableCreateCompanionBuilder,
      $$SourcesTableTableUpdateCompanionBuilder,
      (SourcesTableData, $$SourcesTableTableReferences),
      SourcesTableData,
      PrefetchHooks Function({bool newsTableRefs})
    >;
typedef $$NewsTableTableCreateCompanionBuilder =
    NewsTableCompanion Function({
      Value<String?> sourceId,
      Value<String?> author,
      Value<String?> title,
      Value<String?> description,
      Value<String?> url,
      Value<String?> urlToImage,
      Value<DateTime?> publishedAt,
      Value<String?> content,
      Value<bool> isFeatured,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$NewsTableTableUpdateCompanionBuilder =
    NewsTableCompanion Function({
      Value<String?> sourceId,
      Value<String?> author,
      Value<String?> title,
      Value<String?> description,
      Value<String?> url,
      Value<String?> urlToImage,
      Value<DateTime?> publishedAt,
      Value<String?> content,
      Value<bool> isFeatured,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$NewsTableTableReferences
    extends BaseReferences<_$AppDatabase, $NewsTableTable, NewsTableData> {
  $$NewsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SourcesTableTable _sourceIdTable(_$AppDatabase db) =>
      db.sourcesTable.createAlias(
        $_aliasNameGenerator(db.newsTable.sourceId, db.sourcesTable.sourceId),
      );

  $$SourcesTableTableProcessedTableManager? get sourceId {
    final $_column = $_itemColumn<String>('source_id');
    if ($_column == null) return null;
    final manager = $$SourcesTableTableTableManager(
      $_db,
      $_db.sourcesTable,
    ).filter((f) => f.sourceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SavesTableTable, List<SavesTableData>>
  _savesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.savesTable,
    aliasName: $_aliasNameGenerator(db.newsTable.url, db.savesTable.newsId),
  );

  $$SavesTableTableProcessedTableManager get savesTableRefs {
    final manager = $$SavesTableTableTableManager(
      $_db,
      $_db.savesTable,
    ).filter((f) => f.newsId.url.sqlEquals($_itemColumn<String>('url')));

    final cache = $_typedResult.readTableOrNull(_savesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NewsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SourcesTableTableFilterComposer get sourceId {
    final $$SourcesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourcesTable,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableTableFilterComposer(
            $db: $db,
            $table: $db.sourcesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> savesTableRefs(
    Expression<bool> Function($$SavesTableTableFilterComposer f) f,
  ) {
    final $$SavesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.savesTable,
      getReferencedColumn: (t) => t.newsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavesTableTableFilterComposer(
            $db: $db,
            $table: $db.savesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NewsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SourcesTableTableOrderingComposer get sourceId {
    final $$SourcesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourcesTable,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableTableOrderingComposer(
            $db: $db,
            $table: $db.sourcesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NewsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsTableTable> {
  $$NewsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get urlToImage => $composableBuilder(
    column: $table.urlToImage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<bool> get isFeatured => $composableBuilder(
    column: $table.isFeatured,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SourcesTableTableAnnotationComposer get sourceId {
    final $$SourcesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sourcesTable,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.sourcesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> savesTableRefs<T extends Object>(
    Expression<T> Function($$SavesTableTableAnnotationComposer a) f,
  ) {
    final $$SavesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.url,
      referencedTable: $db.savesTable,
      getReferencedColumn: (t) => t.newsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SavesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.savesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NewsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NewsTableTable,
          NewsTableData,
          $$NewsTableTableFilterComposer,
          $$NewsTableTableOrderingComposer,
          $$NewsTableTableAnnotationComposer,
          $$NewsTableTableCreateCompanionBuilder,
          $$NewsTableTableUpdateCompanionBuilder,
          (NewsTableData, $$NewsTableTableReferences),
          NewsTableData,
          PrefetchHooks Function({bool sourceId, bool savesTableRefs})
        > {
  $$NewsTableTableTableManager(_$AppDatabase db, $NewsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String?> sourceId = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<bool> isFeatured = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsTableCompanion(
                sourceId: sourceId,
                author: author,
                title: title,
                description: description,
                url: url,
                urlToImage: urlToImage,
                publishedAt: publishedAt,
                content: content,
                isFeatured: isFeatured,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String?> sourceId = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> urlToImage = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<bool> isFeatured = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsTableCompanion.insert(
                sourceId: sourceId,
                author: author,
                title: title,
                description: description,
                url: url,
                urlToImage: urlToImage,
                publishedAt: publishedAt,
                content: content,
                isFeatured: isFeatured,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NewsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sourceId = false, savesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (savesTableRefs) db.savesTable],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable: $$NewsTableTableReferences
                                    ._sourceIdTable(db),
                                referencedColumn: $$NewsTableTableReferences
                                    ._sourceIdTable(db)
                                    .sourceId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (savesTableRefs)
                    await $_getPrefetchedData<
                      NewsTableData,
                      $NewsTableTable,
                      SavesTableData
                    >(
                      currentTable: table,
                      referencedTable: $$NewsTableTableReferences
                          ._savesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$NewsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).savesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.newsId == item.url),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NewsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NewsTableTable,
      NewsTableData,
      $$NewsTableTableFilterComposer,
      $$NewsTableTableOrderingComposer,
      $$NewsTableTableAnnotationComposer,
      $$NewsTableTableCreateCompanionBuilder,
      $$NewsTableTableUpdateCompanionBuilder,
      (NewsTableData, $$NewsTableTableReferences),
      NewsTableData,
      PrefetchHooks Function({bool sourceId, bool savesTableRefs})
    >;
typedef $$SavesTableTableCreateCompanionBuilder =
    SavesTableCompanion Function({
      required String newsId,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });
typedef $$SavesTableTableUpdateCompanionBuilder =
    SavesTableCompanion Function({
      Value<String> newsId,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });

final class $$SavesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SavesTableTable, SavesTableData> {
  $$SavesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NewsTableTable _newsIdTable(_$AppDatabase db) =>
      db.newsTable.createAlias(
        $_aliasNameGenerator(db.savesTable.newsId, db.newsTable.url),
      );

  $$NewsTableTableProcessedTableManager get newsId {
    final $_column = $_itemColumn<String>('news_id')!;

    final manager = $$NewsTableTableTableManager(
      $_db,
      $_db.newsTable,
    ).filter((f) => f.url.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_newsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SavesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SavesTableTable> {
  $$SavesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$NewsTableTableFilterComposer get newsId {
    final $$NewsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsTable,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsTableTableFilterComposer(
            $db: $db,
            $table: $db.newsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SavesTableTable> {
  $$SavesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$NewsTableTableOrderingComposer get newsId {
    final $$NewsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsTable,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsTableTableOrderingComposer(
            $db: $db,
            $table: $db.newsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavesTableTable> {
  $$SavesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);

  $$NewsTableTableAnnotationComposer get newsId {
    final $$NewsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsTable,
      getReferencedColumn: (t) => t.url,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.newsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SavesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavesTableTable,
          SavesTableData,
          $$SavesTableTableFilterComposer,
          $$SavesTableTableOrderingComposer,
          $$SavesTableTableAnnotationComposer,
          $$SavesTableTableCreateCompanionBuilder,
          $$SavesTableTableUpdateCompanionBuilder,
          (SavesTableData, $$SavesTableTableReferences),
          SavesTableData,
          PrefetchHooks Function({bool newsId})
        > {
  $$SavesTableTableTableManager(_$AppDatabase db, $SavesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> newsId = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavesTableCompanion(
                newsId: newsId,
                savedAt: savedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String newsId,
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavesTableCompanion.insert(
                newsId: newsId,
                savedAt: savedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SavesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({newsId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (newsId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.newsId,
                                referencedTable: $$SavesTableTableReferences
                                    ._newsIdTable(db),
                                referencedColumn: $$SavesTableTableReferences
                                    ._newsIdTable(db)
                                    .url,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SavesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavesTableTable,
      SavesTableData,
      $$SavesTableTableFilterComposer,
      $$SavesTableTableOrderingComposer,
      $$SavesTableTableAnnotationComposer,
      $$SavesTableTableCreateCompanionBuilder,
      $$SavesTableTableUpdateCompanionBuilder,
      (SavesTableData, $$SavesTableTableReferences),
      SavesTableData,
      PrefetchHooks Function({bool newsId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SourcesTableTableTableManager get sourcesTable =>
      $$SourcesTableTableTableManager(_db, _db.sourcesTable);
  $$NewsTableTableTableManager get newsTable =>
      $$NewsTableTableTableManager(_db, _db.newsTable);
  $$SavesTableTableTableManager get savesTable =>
      $$SavesTableTableTableManager(_db, _db.savesTable);
}
