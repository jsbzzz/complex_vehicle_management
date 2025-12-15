import 'package:drift/drift.dart';

import 'VillagerTable.dart';

// 💡 일반화된 테이블 클래스
class VehicleTable extends Table {
  IntColumn get vehicleId => integer().autoIncrement()();

  TextColumn get vehicleNumber => text().withLength(min: 7, max: 8)();

  TextColumn get vehicleModel => text()();

  TextColumn get ownerPhone => text()();

  TextColumn get ownerName => text()();

  IntColumn get ownerId => integer().references(VillagerTable, #id)();
}