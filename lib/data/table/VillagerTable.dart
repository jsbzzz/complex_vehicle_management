import 'package:drift/drift.dart';

// 💡 일반화된 테이블 클래스
class VillagerTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 2,max: 30)();

  TextColumn get addr => text()();

  TextColumn get phoneNumber => text()();

}