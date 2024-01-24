// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TimestampTableTable extends TimestampTable
    with TableInfo<$TimestampTableTable, TimestampEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimestampTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timestamp_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimestampEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimestampEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimestampEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $TimestampTableTable createAlias(String alias) {
    return $TimestampTableTable(attachedDatabase, alias);
  }
}

class TimestampEntity extends DataClass implements Insertable<TimestampEntity> {
  final int id;
  final DateTime date;
  const TimestampEntity({required this.id, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TimestampTableCompanion toCompanion(bool nullToAbsent) {
    return TimestampTableCompanion(
      id: Value(id),
      date: Value(date),
    );
  }

  factory TimestampEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimestampEntity(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TimestampEntity copyWith({int? id, DateTime? date}) => TimestampEntity(
        id: id ?? this.id,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('TimestampEntity(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimestampEntity &&
          other.id == this.id &&
          other.date == this.date);
}

class TimestampTableCompanion extends UpdateCompanion<TimestampEntity> {
  final Value<int> id;
  final Value<DateTime> date;
  const TimestampTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
  });
  TimestampTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<TimestampEntity> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
    });
  }

  TimestampTableCompanion copyWith({Value<int>? id, Value<DateTime>? date}) {
    return TimestampTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimestampTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $CurrencyTableTable extends CurrencyTable
    with TableInfo<$CurrencyTableTable, CurrencyEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exchangeMeta =
      const VerificationMeta('exchange');
  @override
  late final GeneratedColumn<double> exchange = GeneratedColumn<double>(
      'exchange', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
      'flag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampIdMeta =
      const VerificationMeta('timestampId');
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
      'timestamp_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timestamp_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [key, name, exchange, flag, timestampId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_table';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('exchange')) {
      context.handle(_exchangeMeta,
          exchange.isAcceptableOrUnknown(data['exchange']!, _exchangeMeta));
    } else if (isInserting) {
      context.missing(_exchangeMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
          _timestampIdMeta,
          timestampId.isAcceptableOrUnknown(
              data['timestamp_id']!, _timestampIdMeta));
    } else if (isInserting) {
      context.missing(_timestampIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key, exchange};
  @override
  CurrencyEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyEntity(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      exchange: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag'])!,
      timestampId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp_id'])!,
    );
  }

  @override
  $CurrencyTableTable createAlias(String alias) {
    return $CurrencyTableTable(attachedDatabase, alias);
  }
}

class CurrencyEntity extends DataClass implements Insertable<CurrencyEntity> {
  final String key;
  final String name;
  final double exchange;
  final String flag;
  final int timestampId;
  const CurrencyEntity(
      {required this.key,
      required this.name,
      required this.exchange,
      required this.flag,
      required this.timestampId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    map['exchange'] = Variable<double>(exchange);
    map['flag'] = Variable<String>(flag);
    map['timestamp_id'] = Variable<int>(timestampId);
    return map;
  }

  CurrencyTableCompanion toCompanion(bool nullToAbsent) {
    return CurrencyTableCompanion(
      key: Value(key),
      name: Value(name),
      exchange: Value(exchange),
      flag: Value(flag),
      timestampId: Value(timestampId),
    );
  }

  factory CurrencyEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyEntity(
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      exchange: serializer.fromJson<double>(json['exchange']),
      flag: serializer.fromJson<String>(json['flag']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'exchange': serializer.toJson<double>(exchange),
      'flag': serializer.toJson<String>(flag),
      'timestampId': serializer.toJson<int>(timestampId),
    };
  }

  CurrencyEntity copyWith(
          {String? key,
          String? name,
          double? exchange,
          String? flag,
          int? timestampId}) =>
      CurrencyEntity(
        key: key ?? this.key,
        name: name ?? this.name,
        exchange: exchange ?? this.exchange,
        flag: flag ?? this.flag,
        timestampId: timestampId ?? this.timestampId,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyEntity(')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('exchange: $exchange, ')
          ..write('flag: $flag, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, name, exchange, flag, timestampId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyEntity &&
          other.key == this.key &&
          other.name == this.name &&
          other.exchange == this.exchange &&
          other.flag == this.flag &&
          other.timestampId == this.timestampId);
}

class CurrencyTableCompanion extends UpdateCompanion<CurrencyEntity> {
  final Value<String> key;
  final Value<String> name;
  final Value<double> exchange;
  final Value<String> flag;
  final Value<int> timestampId;
  final Value<int> rowid;
  const CurrencyTableCompanion({
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.exchange = const Value.absent(),
    this.flag = const Value.absent(),
    this.timestampId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyTableCompanion.insert({
    required String key,
    required String name,
    required double exchange,
    required String flag,
    required int timestampId,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        name = Value(name),
        exchange = Value(exchange),
        flag = Value(flag),
        timestampId = Value(timestampId);
  static Insertable<CurrencyEntity> custom({
    Expression<String>? key,
    Expression<String>? name,
    Expression<double>? exchange,
    Expression<String>? flag,
    Expression<int>? timestampId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (exchange != null) 'exchange': exchange,
      if (flag != null) 'flag': flag,
      if (timestampId != null) 'timestamp_id': timestampId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyTableCompanion copyWith(
      {Value<String>? key,
      Value<String>? name,
      Value<double>? exchange,
      Value<String>? flag,
      Value<int>? timestampId,
      Value<int>? rowid}) {
    return CurrencyTableCompanion(
      key: key ?? this.key,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      flag: flag ?? this.flag,
      timestampId: timestampId ?? this.timestampId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (exchange.present) {
      map['exchange'] = Variable<double>(exchange.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyTableCompanion(')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('exchange: $exchange, ')
          ..write('flag: $flag, ')
          ..write('timestampId: $timestampId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TimestampTableTable timestampTable = $TimestampTableTable(this);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [timestampTable, currencyTable];
}
