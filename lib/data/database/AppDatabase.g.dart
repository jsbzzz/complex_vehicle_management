// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// ignore_for_file: type=lint
class $VillagerTableTable extends VillagerTable
    with TableInfo<$VillagerTableTable, VillagerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VillagerTableTable(this.attachedDatabase, [this._alias]);
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
      minTextLength: 2,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addrMeta = const VerificationMeta('addr');
  @override
  late final GeneratedColumn<String> addr = GeneratedColumn<String>(
    'addr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, addr, phoneNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'villager_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VillagerTableData> instance, {
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
    if (data.containsKey('addr')) {
      context.handle(
        _addrMeta,
        addr.isAcceptableOrUnknown(data['addr']!, _addrMeta),
      );
    } else if (isInserting) {
      context.missing(_addrMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VillagerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VillagerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      addr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}addr'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
    );
  }

  @override
  $VillagerTableTable createAlias(String alias) {
    return $VillagerTableTable(attachedDatabase, alias);
  }
}

class VillagerTableData extends DataClass
    implements Insertable<VillagerTableData> {
  final int id;
  final String name;
  final String addr;
  final String phoneNumber;
  const VillagerTableData({
    required this.id,
    required this.name,
    required this.addr,
    required this.phoneNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['addr'] = Variable<String>(addr);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  VillagerTableCompanion toCompanion(bool nullToAbsent) {
    return VillagerTableCompanion(
      id: Value(id),
      name: Value(name),
      addr: Value(addr),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory VillagerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VillagerTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      addr: serializer.fromJson<String>(json['addr']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'addr': serializer.toJson<String>(addr),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  VillagerTableData copyWith({
    int? id,
    String? name,
    String? addr,
    String? phoneNumber,
  }) => VillagerTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    addr: addr ?? this.addr,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  VillagerTableData copyWithCompanion(VillagerTableCompanion data) {
    return VillagerTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      addr: data.addr.present ? data.addr.value : this.addr,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VillagerTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('addr: $addr, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, addr, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VillagerTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.addr == this.addr &&
          other.phoneNumber == this.phoneNumber);
}

class VillagerTableCompanion extends UpdateCompanion<VillagerTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> addr;
  final Value<String> phoneNumber;
  const VillagerTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.addr = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  VillagerTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String addr,
    required String phoneNumber,
  }) : name = Value(name),
       addr = Value(addr),
       phoneNumber = Value(phoneNumber);
  static Insertable<VillagerTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? addr,
    Expression<String>? phoneNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (addr != null) 'addr': addr,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    });
  }

  VillagerTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? addr,
    Value<String>? phoneNumber,
  }) {
    return VillagerTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      addr: addr ?? this.addr,
      phoneNumber: phoneNumber ?? this.phoneNumber,
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
    if (addr.present) {
      map['addr'] = Variable<String>(addr.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VillagerTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('addr: $addr, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }
}

class $VehicleTableTable extends VehicleTable
    with TableInfo<$VehicleTableTable, VehicleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vehicleNumberMeta = const VerificationMeta(
    'vehicleNumber',
  );
  @override
  late final GeneratedColumn<String> vehicleNumber = GeneratedColumn<String>(
    'vehicle_number',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleModelMeta = const VerificationMeta(
    'vehicleModel',
  );
  @override
  late final GeneratedColumn<String> vehicleModel = GeneratedColumn<String>(
    'vehicle_model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerPhoneMeta = const VerificationMeta(
    'ownerPhone',
  );
  @override
  late final GeneratedColumn<String> ownerPhone = GeneratedColumn<String>(
    'owner_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _villagerIdMeta = const VerificationMeta(
    'villagerId',
  );
  @override
  late final GeneratedColumn<int> villagerId = GeneratedColumn<int>(
    'villager_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES villager_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    vehicleId,
    vehicleNumber,
    vehicleModel,
    ownerPhone,
    ownerName,
    villagerId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    }
    if (data.containsKey('vehicle_number')) {
      context.handle(
        _vehicleNumberMeta,
        vehicleNumber.isAcceptableOrUnknown(
          data['vehicle_number']!,
          _vehicleNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleNumberMeta);
    }
    if (data.containsKey('vehicle_model')) {
      context.handle(
        _vehicleModelMeta,
        vehicleModel.isAcceptableOrUnknown(
          data['vehicle_model']!,
          _vehicleModelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vehicleModelMeta);
    }
    if (data.containsKey('owner_phone')) {
      context.handle(
        _ownerPhoneMeta,
        ownerPhone.isAcceptableOrUnknown(data['owner_phone']!, _ownerPhoneMeta),
      );
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    }
    if (data.containsKey('villager_id')) {
      context.handle(
        _villagerIdMeta,
        villagerId.isAcceptableOrUnknown(data['villager_id']!, _villagerIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {vehicleId};
  @override
  VehicleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleTableData(
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      vehicleNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_number'],
      )!,
      vehicleModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_model'],
      )!,
      ownerPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_phone'],
      ),
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      ),
      villagerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}villager_id'],
      ),
    );
  }

  @override
  $VehicleTableTable createAlias(String alias) {
    return $VehicleTableTable(attachedDatabase, alias);
  }
}

class VehicleTableData extends DataClass
    implements Insertable<VehicleTableData> {
  final int vehicleId;
  final String vehicleNumber;
  final String vehicleModel;
  final String? ownerPhone;
  final String? ownerName;
  final int? villagerId;
  const VehicleTableData({
    required this.vehicleId,
    required this.vehicleNumber,
    required this.vehicleModel,
    this.ownerPhone,
    this.ownerName,
    this.villagerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['vehicle_number'] = Variable<String>(vehicleNumber);
    map['vehicle_model'] = Variable<String>(vehicleModel);
    if (!nullToAbsent || ownerPhone != null) {
      map['owner_phone'] = Variable<String>(ownerPhone);
    }
    if (!nullToAbsent || ownerName != null) {
      map['owner_name'] = Variable<String>(ownerName);
    }
    if (!nullToAbsent || villagerId != null) {
      map['villager_id'] = Variable<int>(villagerId);
    }
    return map;
  }

  VehicleTableCompanion toCompanion(bool nullToAbsent) {
    return VehicleTableCompanion(
      vehicleId: Value(vehicleId),
      vehicleNumber: Value(vehicleNumber),
      vehicleModel: Value(vehicleModel),
      ownerPhone: ownerPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerPhone),
      ownerName: ownerName == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerName),
      villagerId: villagerId == null && nullToAbsent
          ? const Value.absent()
          : Value(villagerId),
    );
  }

  factory VehicleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleTableData(
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      vehicleNumber: serializer.fromJson<String>(json['vehicleNumber']),
      vehicleModel: serializer.fromJson<String>(json['vehicleModel']),
      ownerPhone: serializer.fromJson<String?>(json['ownerPhone']),
      ownerName: serializer.fromJson<String?>(json['ownerName']),
      villagerId: serializer.fromJson<int?>(json['villagerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'vehicleId': serializer.toJson<int>(vehicleId),
      'vehicleNumber': serializer.toJson<String>(vehicleNumber),
      'vehicleModel': serializer.toJson<String>(vehicleModel),
      'ownerPhone': serializer.toJson<String?>(ownerPhone),
      'ownerName': serializer.toJson<String?>(ownerName),
      'villagerId': serializer.toJson<int?>(villagerId),
    };
  }

  VehicleTableData copyWith({
    int? vehicleId,
    String? vehicleNumber,
    String? vehicleModel,
    Value<String?> ownerPhone = const Value.absent(),
    Value<String?> ownerName = const Value.absent(),
    Value<int?> villagerId = const Value.absent(),
  }) => VehicleTableData(
    vehicleId: vehicleId ?? this.vehicleId,
    vehicleNumber: vehicleNumber ?? this.vehicleNumber,
    vehicleModel: vehicleModel ?? this.vehicleModel,
    ownerPhone: ownerPhone.present ? ownerPhone.value : this.ownerPhone,
    ownerName: ownerName.present ? ownerName.value : this.ownerName,
    villagerId: villagerId.present ? villagerId.value : this.villagerId,
  );
  VehicleTableData copyWithCompanion(VehicleTableCompanion data) {
    return VehicleTableData(
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      vehicleNumber: data.vehicleNumber.present
          ? data.vehicleNumber.value
          : this.vehicleNumber,
      vehicleModel: data.vehicleModel.present
          ? data.vehicleModel.value
          : this.vehicleModel,
      ownerPhone: data.ownerPhone.present
          ? data.ownerPhone.value
          : this.ownerPhone,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      villagerId: data.villagerId.present
          ? data.villagerId.value
          : this.villagerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleTableData(')
          ..write('vehicleId: $vehicleId, ')
          ..write('vehicleNumber: $vehicleNumber, ')
          ..write('vehicleModel: $vehicleModel, ')
          ..write('ownerPhone: $ownerPhone, ')
          ..write('ownerName: $ownerName, ')
          ..write('villagerId: $villagerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    vehicleId,
    vehicleNumber,
    vehicleModel,
    ownerPhone,
    ownerName,
    villagerId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleTableData &&
          other.vehicleId == this.vehicleId &&
          other.vehicleNumber == this.vehicleNumber &&
          other.vehicleModel == this.vehicleModel &&
          other.ownerPhone == this.ownerPhone &&
          other.ownerName == this.ownerName &&
          other.villagerId == this.villagerId);
}

class VehicleTableCompanion extends UpdateCompanion<VehicleTableData> {
  final Value<int> vehicleId;
  final Value<String> vehicleNumber;
  final Value<String> vehicleModel;
  final Value<String?> ownerPhone;
  final Value<String?> ownerName;
  final Value<int?> villagerId;
  const VehicleTableCompanion({
    this.vehicleId = const Value.absent(),
    this.vehicleNumber = const Value.absent(),
    this.vehicleModel = const Value.absent(),
    this.ownerPhone = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.villagerId = const Value.absent(),
  });
  VehicleTableCompanion.insert({
    this.vehicleId = const Value.absent(),
    required String vehicleNumber,
    required String vehicleModel,
    this.ownerPhone = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.villagerId = const Value.absent(),
  }) : vehicleNumber = Value(vehicleNumber),
       vehicleModel = Value(vehicleModel);
  static Insertable<VehicleTableData> custom({
    Expression<int>? vehicleId,
    Expression<String>? vehicleNumber,
    Expression<String>? vehicleModel,
    Expression<String>? ownerPhone,
    Expression<String>? ownerName,
    Expression<int>? villagerId,
  }) {
    return RawValuesInsertable({
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (vehicleNumber != null) 'vehicle_number': vehicleNumber,
      if (vehicleModel != null) 'vehicle_model': vehicleModel,
      if (ownerPhone != null) 'owner_phone': ownerPhone,
      if (ownerName != null) 'owner_name': ownerName,
      if (villagerId != null) 'villager_id': villagerId,
    });
  }

  VehicleTableCompanion copyWith({
    Value<int>? vehicleId,
    Value<String>? vehicleNumber,
    Value<String>? vehicleModel,
    Value<String?>? ownerPhone,
    Value<String?>? ownerName,
    Value<int?>? villagerId,
  }) {
    return VehicleTableCompanion(
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      ownerName: ownerName ?? this.ownerName,
      villagerId: villagerId ?? this.villagerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (vehicleNumber.present) {
      map['vehicle_number'] = Variable<String>(vehicleNumber.value);
    }
    if (vehicleModel.present) {
      map['vehicle_model'] = Variable<String>(vehicleModel.value);
    }
    if (ownerPhone.present) {
      map['owner_phone'] = Variable<String>(ownerPhone.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (villagerId.present) {
      map['villager_id'] = Variable<int>(villagerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleTableCompanion(')
          ..write('vehicleId: $vehicleId, ')
          ..write('vehicleNumber: $vehicleNumber, ')
          ..write('vehicleModel: $vehicleModel, ')
          ..write('ownerPhone: $ownerPhone, ')
          ..write('ownerName: $ownerName, ')
          ..write('villagerId: $villagerId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VillagerTableTable villagerTable = $VillagerTableTable(this);
  late final $VehicleTableTable vehicleTable = $VehicleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    villagerTable,
    vehicleTable,
  ];
}

typedef $$VillagerTableTableCreateCompanionBuilder =
    VillagerTableCompanion Function({
      Value<int> id,
      required String name,
      required String addr,
      required String phoneNumber,
    });
typedef $$VillagerTableTableUpdateCompanionBuilder =
    VillagerTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> addr,
      Value<String> phoneNumber,
    });

final class $$VillagerTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $VillagerTableTable, VillagerTableData> {
  $$VillagerTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$VehicleTableTable, List<VehicleTableData>>
  _vehicleTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vehicleTable,
    aliasName: $_aliasNameGenerator(
      db.villagerTable.id,
      db.vehicleTable.villagerId,
    ),
  );

  $$VehicleTableTableProcessedTableManager get vehicleTableRefs {
    final manager = $$VehicleTableTableTableManager(
      $_db,
      $_db.vehicleTable,
    ).filter((f) => f.villagerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vehicleTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VillagerTableTableFilterComposer
    extends Composer<_$AppDatabase, $VillagerTableTable> {
  $$VillagerTableTableFilterComposer({
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

  ColumnFilters<String> get addr => $composableBuilder(
    column: $table.addr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vehicleTableRefs(
    Expression<bool> Function($$VehicleTableTableFilterComposer f) f,
  ) {
    final $$VehicleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleTable,
      getReferencedColumn: (t) => t.villagerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTableTableFilterComposer(
            $db: $db,
            $table: $db.vehicleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VillagerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VillagerTableTable> {
  $$VillagerTableTableOrderingComposer({
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

  ColumnOrderings<String> get addr => $composableBuilder(
    column: $table.addr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VillagerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VillagerTableTable> {
  $$VillagerTableTableAnnotationComposer({
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

  GeneratedColumn<String> get addr =>
      $composableBuilder(column: $table.addr, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  Expression<T> vehicleTableRefs<T extends Object>(
    Expression<T> Function($$VehicleTableTableAnnotationComposer a) f,
  ) {
    final $$VehicleTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vehicleTable,
      getReferencedColumn: (t) => t.villagerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehicleTableTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VillagerTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VillagerTableTable,
          VillagerTableData,
          $$VillagerTableTableFilterComposer,
          $$VillagerTableTableOrderingComposer,
          $$VillagerTableTableAnnotationComposer,
          $$VillagerTableTableCreateCompanionBuilder,
          $$VillagerTableTableUpdateCompanionBuilder,
          (VillagerTableData, $$VillagerTableTableReferences),
          VillagerTableData,
          PrefetchHooks Function({bool vehicleTableRefs})
        > {
  $$VillagerTableTableTableManager(_$AppDatabase db, $VillagerTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VillagerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VillagerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VillagerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> addr = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
              }) => VillagerTableCompanion(
                id: id,
                name: name,
                addr: addr,
                phoneNumber: phoneNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String addr,
                required String phoneNumber,
              }) => VillagerTableCompanion.insert(
                id: id,
                name: name,
                addr: addr,
                phoneNumber: phoneNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VillagerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vehicleTableRefs) db.vehicleTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vehicleTableRefs)
                    await $_getPrefetchedData<
                      VillagerTableData,
                      $VillagerTableTable,
                      VehicleTableData
                    >(
                      currentTable: table,
                      referencedTable: $$VillagerTableTableReferences
                          ._vehicleTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VillagerTableTableReferences(
                            db,
                            table,
                            p0,
                          ).vehicleTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.villagerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VillagerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VillagerTableTable,
      VillagerTableData,
      $$VillagerTableTableFilterComposer,
      $$VillagerTableTableOrderingComposer,
      $$VillagerTableTableAnnotationComposer,
      $$VillagerTableTableCreateCompanionBuilder,
      $$VillagerTableTableUpdateCompanionBuilder,
      (VillagerTableData, $$VillagerTableTableReferences),
      VillagerTableData,
      PrefetchHooks Function({bool vehicleTableRefs})
    >;
typedef $$VehicleTableTableCreateCompanionBuilder =
    VehicleTableCompanion Function({
      Value<int> vehicleId,
      required String vehicleNumber,
      required String vehicleModel,
      Value<String?> ownerPhone,
      Value<String?> ownerName,
      Value<int?> villagerId,
    });
typedef $$VehicleTableTableUpdateCompanionBuilder =
    VehicleTableCompanion Function({
      Value<int> vehicleId,
      Value<String> vehicleNumber,
      Value<String> vehicleModel,
      Value<String?> ownerPhone,
      Value<String?> ownerName,
      Value<int?> villagerId,
    });

final class $$VehicleTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $VehicleTableTable, VehicleTableData> {
  $$VehicleTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VillagerTableTable _villagerIdTable(_$AppDatabase db) =>
      db.villagerTable.createAlias(
        $_aliasNameGenerator(db.vehicleTable.villagerId, db.villagerTable.id),
      );

  $$VillagerTableTableProcessedTableManager? get villagerId {
    final $_column = $_itemColumn<int>('villager_id');
    if ($_column == null) return null;
    final manager = $$VillagerTableTableTableManager(
      $_db,
      $_db.villagerTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_villagerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VehicleTableTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleTableTable> {
  $$VehicleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vehicleModel => $composableBuilder(
    column: $table.vehicleModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  $$VillagerTableTableFilterComposer get villagerId {
    final $$VillagerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villagerId,
      referencedTable: $db.villagerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagerTableTableFilterComposer(
            $db: $db,
            $table: $db.villagerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleTableTable> {
  $$VehicleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vehicleModel => $composableBuilder(
    column: $table.vehicleModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  $$VillagerTableTableOrderingComposer get villagerId {
    final $$VillagerTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villagerId,
      referencedTable: $db.villagerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagerTableTableOrderingComposer(
            $db: $db,
            $table: $db.villagerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleTableTable> {
  $$VehicleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get vehicleNumber => $composableBuilder(
    column: $table.vehicleNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vehicleModel => $composableBuilder(
    column: $table.vehicleModel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  $$VillagerTableTableAnnotationComposer get villagerId {
    final $$VillagerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villagerId,
      referencedTable: $db.villagerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagerTableTableAnnotationComposer(
            $db: $db,
            $table: $db.villagerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VehicleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehicleTableTable,
          VehicleTableData,
          $$VehicleTableTableFilterComposer,
          $$VehicleTableTableOrderingComposer,
          $$VehicleTableTableAnnotationComposer,
          $$VehicleTableTableCreateCompanionBuilder,
          $$VehicleTableTableUpdateCompanionBuilder,
          (VehicleTableData, $$VehicleTableTableReferences),
          VehicleTableData,
          PrefetchHooks Function({bool villagerId})
        > {
  $$VehicleTableTableTableManager(_$AppDatabase db, $VehicleTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> vehicleId = const Value.absent(),
                Value<String> vehicleNumber = const Value.absent(),
                Value<String> vehicleModel = const Value.absent(),
                Value<String?> ownerPhone = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<int?> villagerId = const Value.absent(),
              }) => VehicleTableCompanion(
                vehicleId: vehicleId,
                vehicleNumber: vehicleNumber,
                vehicleModel: vehicleModel,
                ownerPhone: ownerPhone,
                ownerName: ownerName,
                villagerId: villagerId,
              ),
          createCompanionCallback:
              ({
                Value<int> vehicleId = const Value.absent(),
                required String vehicleNumber,
                required String vehicleModel,
                Value<String?> ownerPhone = const Value.absent(),
                Value<String?> ownerName = const Value.absent(),
                Value<int?> villagerId = const Value.absent(),
              }) => VehicleTableCompanion.insert(
                vehicleId: vehicleId,
                vehicleNumber: vehicleNumber,
                vehicleModel: vehicleModel,
                ownerPhone: ownerPhone,
                ownerName: ownerName,
                villagerId: villagerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehicleTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({villagerId = false}) {
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
                    if (villagerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.villagerId,
                                referencedTable: $$VehicleTableTableReferences
                                    ._villagerIdTable(db),
                                referencedColumn: $$VehicleTableTableReferences
                                    ._villagerIdTable(db)
                                    .id,
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

typedef $$VehicleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehicleTableTable,
      VehicleTableData,
      $$VehicleTableTableFilterComposer,
      $$VehicleTableTableOrderingComposer,
      $$VehicleTableTableAnnotationComposer,
      $$VehicleTableTableCreateCompanionBuilder,
      $$VehicleTableTableUpdateCompanionBuilder,
      (VehicleTableData, $$VehicleTableTableReferences),
      VehicleTableData,
      PrefetchHooks Function({bool villagerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VillagerTableTableTableManager get villagerTable =>
      $$VillagerTableTableTableManager(_db, _db.villagerTable);
  $$VehicleTableTableTableManager get vehicleTable =>
      $$VehicleTableTableTableManager(_db, _db.vehicleTable);
}
