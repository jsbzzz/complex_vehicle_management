import 'package:drift/drift.dart';

import 'VillagerTable.dart';

// 💡 일반화된 테이블 클래스
class VehicleTable extends Table {
  //데이터베이스에서 사용되는 정보 실제 차량 정보는 아님
  IntColumn get vehicleId => integer().autoIncrement()();

  //실제 차량에 대한 정보들
  TextColumn get vehicleNumber => text().withLength(min: 7, max: 8)();

  TextColumn get vehicleModel => text()();

  TextColumn get ownerPhone => text().nullable()();

  TextColumn get ownerName => text().nullable()();

  IntColumn get villagerId => integer().nullable().references(VillagerTable, #id)();
}