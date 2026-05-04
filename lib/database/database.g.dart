// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AlatsTable extends Alats with TableInfo<$AlatsTable, Alat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, price, location, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alats';
  @override
  VerificationContext validateIntegrity(
    Insertable<Alat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $AlatsTable createAlias(String alias) {
    return $AlatsTable(attachedDatabase, alias);
  }
}

class Alat extends DataClass implements Insertable<Alat> {
  final int id;
  final String name;
  final String price;
  final String location;
  final String imageUrl;
  const Alat({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<String>(price);
    map['location'] = Variable<String>(location);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  AlatsCompanion toCompanion(bool nullToAbsent) {
    return AlatsCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      location: Value(location),
      imageUrl: Value(imageUrl),
    );
  }

  factory Alat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alat(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<String>(json['price']),
      location: serializer.fromJson<String>(json['location']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<String>(price),
      'location': serializer.toJson<String>(location),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  Alat copyWith({
    int? id,
    String? name,
    String? price,
    String? location,
    String? imageUrl,
  }) => Alat(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    location: location ?? this.location,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  Alat copyWithCompanion(AlatsCompanion data) {
    return Alat(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      location: data.location.present ? data.location.value : this.location,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alat(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, location, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alat &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.location == this.location &&
          other.imageUrl == this.imageUrl);
}

class AlatsCompanion extends UpdateCompanion<Alat> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> price;
  final Value<String> location;
  final Value<String> imageUrl;
  const AlatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.location = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  AlatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String price,
    required String location,
    required String imageUrl,
  }) : name = Value(name),
       price = Value(price),
       location = Value(location),
       imageUrl = Value(imageUrl);
  static Insertable<Alat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? price,
    Expression<String>? location,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (location != null) 'location': location,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  AlatsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? price,
    Value<String>? location,
    Value<String>? imageUrl,
  }) {
    return AlatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('location: $location, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $SesssionsTable extends Sesssions
    with TableInfo<$SesssionsTable, Sesssion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SesssionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLoggedInMeta = const VerificationMeta(
    'isLoggedIn',
  );
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
    'is_logged_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_logged_in" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, username, isLoggedIn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sesssions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Sesssion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
        _isLoggedInMeta,
        isLoggedIn.isAcceptableOrUnknown(
          data['is_logged_in']!,
          _isLoggedInMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sesssion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sesssion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      isLoggedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_logged_in'],
      )!,
    );
  }

  @override
  $SesssionsTable createAlias(String alias) {
    return $SesssionsTable(attachedDatabase, alias);
  }
}

class Sesssion extends DataClass implements Insertable<Sesssion> {
  final int id;
  final String username;
  final bool isLoggedIn;
  const Sesssion({
    required this.id,
    required this.username,
    required this.isLoggedIn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    return map;
  }

  SesssionsCompanion toCompanion(bool nullToAbsent) {
    return SesssionsCompanion(
      id: Value(id),
      username: Value(username),
      isLoggedIn: Value(isLoggedIn),
    );
  }

  factory Sesssion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sesssion(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
    };
  }

  Sesssion copyWith({int? id, String? username, bool? isLoggedIn}) => Sesssion(
    id: id ?? this.id,
    username: username ?? this.username,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
  );
  Sesssion copyWithCompanion(SesssionsCompanion data) {
    return Sesssion(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      isLoggedIn: data.isLoggedIn.present
          ? data.isLoggedIn.value
          : this.isLoggedIn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sesssion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('isLoggedIn: $isLoggedIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, isLoggedIn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sesssion &&
          other.id == this.id &&
          other.username == this.username &&
          other.isLoggedIn == this.isLoggedIn);
}

class SesssionsCompanion extends UpdateCompanion<Sesssion> {
  final Value<int> id;
  final Value<String> username;
  final Value<bool> isLoggedIn;
  const SesssionsCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
  });
  SesssionsCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    this.isLoggedIn = const Value.absent(),
  }) : username = Value(username);
  static Insertable<Sesssion> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<bool>? isLoggedIn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
    });
  }

  SesssionsCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<bool>? isLoggedIn,
  }) {
    return SesssionsCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SesssionsCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('isLoggedIn: $isLoggedIn')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $AlatsTable alats = $AlatsTable(this);
  late final $SesssionsTable sesssions = $SesssionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [alats, sesssions];
}

typedef $$AlatsTableCreateCompanionBuilder =
    AlatsCompanion Function({
      Value<int> id,
      required String name,
      required String price,
      required String location,
      required String imageUrl,
    });
typedef $$AlatsTableUpdateCompanionBuilder =
    AlatsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> price,
      Value<String> location,
      Value<String> imageUrl,
    });

class $$AlatsTableFilterComposer extends Composer<_$MyDatabase, $AlatsTable> {
  $$AlatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlatsTableOrderingComposer extends Composer<_$MyDatabase, $AlatsTable> {
  $$AlatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlatsTableAnnotationComposer
    extends Composer<_$MyDatabase, $AlatsTable> {
  $$AlatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$AlatsTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $AlatsTable,
          Alat,
          $$AlatsTableFilterComposer,
          $$AlatsTableOrderingComposer,
          $$AlatsTableAnnotationComposer,
          $$AlatsTableCreateCompanionBuilder,
          $$AlatsTableUpdateCompanionBuilder,
          (Alat, BaseReferences<_$MyDatabase, $AlatsTable, Alat>),
          Alat,
          PrefetchHooks Function()
        > {
  $$AlatsTableTableManager(_$MyDatabase db, $AlatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => AlatsCompanion(
                id: id,
                name: name,
                price: price,
                location: location,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String price,
                required String location,
                required String imageUrl,
              }) => AlatsCompanion.insert(
                id: id,
                name: name,
                price: price,
                location: location,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlatsTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $AlatsTable,
      Alat,
      $$AlatsTableFilterComposer,
      $$AlatsTableOrderingComposer,
      $$AlatsTableAnnotationComposer,
      $$AlatsTableCreateCompanionBuilder,
      $$AlatsTableUpdateCompanionBuilder,
      (Alat, BaseReferences<_$MyDatabase, $AlatsTable, Alat>),
      Alat,
      PrefetchHooks Function()
    >;
typedef $$SesssionsTableCreateCompanionBuilder =
    SesssionsCompanion Function({
      Value<int> id,
      required String username,
      Value<bool> isLoggedIn,
    });
typedef $$SesssionsTableUpdateCompanionBuilder =
    SesssionsCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<bool> isLoggedIn,
    });

class $$SesssionsTableFilterComposer
    extends Composer<_$MyDatabase, $SesssionsTable> {
  $$SesssionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SesssionsTableOrderingComposer
    extends Composer<_$MyDatabase, $SesssionsTable> {
  $$SesssionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SesssionsTableAnnotationComposer
    extends Composer<_$MyDatabase, $SesssionsTable> {
  $$SesssionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => column,
  );
}

class $$SesssionsTableTableManager
    extends
        RootTableManager<
          _$MyDatabase,
          $SesssionsTable,
          Sesssion,
          $$SesssionsTableFilterComposer,
          $$SesssionsTableOrderingComposer,
          $$SesssionsTableAnnotationComposer,
          $$SesssionsTableCreateCompanionBuilder,
          $$SesssionsTableUpdateCompanionBuilder,
          (Sesssion, BaseReferences<_$MyDatabase, $SesssionsTable, Sesssion>),
          Sesssion,
          PrefetchHooks Function()
        > {
  $$SesssionsTableTableManager(_$MyDatabase db, $SesssionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SesssionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SesssionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SesssionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<bool> isLoggedIn = const Value.absent(),
              }) => SesssionsCompanion(
                id: id,
                username: username,
                isLoggedIn: isLoggedIn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                Value<bool> isLoggedIn = const Value.absent(),
              }) => SesssionsCompanion.insert(
                id: id,
                username: username,
                isLoggedIn: isLoggedIn,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SesssionsTableProcessedTableManager =
    ProcessedTableManager<
      _$MyDatabase,
      $SesssionsTable,
      Sesssion,
      $$SesssionsTableFilterComposer,
      $$SesssionsTableOrderingComposer,
      $$SesssionsTableAnnotationComposer,
      $$SesssionsTableCreateCompanionBuilder,
      $$SesssionsTableUpdateCompanionBuilder,
      (Sesssion, BaseReferences<_$MyDatabase, $SesssionsTable, Sesssion>),
      Sesssion,
      PrefetchHooks Function()
    >;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$AlatsTableTableManager get alats =>
      $$AlatsTableTableManager(_db, _db.alats);
  $$SesssionsTableTableManager get sesssions =>
      $$SesssionsTableTableManager(_db, _db.sesssions);
}
