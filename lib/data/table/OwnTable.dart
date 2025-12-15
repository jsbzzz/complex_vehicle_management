import 'package:drift/drift.dart';
import 'VillagerTable.dart';

// 💡 일반화된 테이블 클래스
class OwnTable extends Table {

  IntColumn get ownerId => integer().references(VillagerTable, #id)();
}