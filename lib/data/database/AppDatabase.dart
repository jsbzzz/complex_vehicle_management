// 💡 코드 생성기가 만들 파일명을 명시 (반드시 필요!)
import 'package:drift/drift.dart';
import 'package:drift/native.dart'; // NativeDatabase 사용
import 'package:path_provider/path_provider.dart'; // getApplicationDocumentsDirectory 사용
import 'package:path/path.dart' as p; // 파일 경로 조작
import 'dart:io'; // Platform 사용
import 'package:sqlite3/sqlite3.dart'; // sqlite3.open 사용

import '../table/Tables.dart';
part 'AppDatabase.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // 플랫폼별 SQLite 초기화
    if (Platform.isAndroid || Platform.isIOS) {
      sqlite3.open(file.path);
    }

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [VehicleTable, VillagerTable, OwnTable])
class AppDatabase extends _$AppDatabase {
  // 생성자에서 데이터베이스 연결을 설정하는 함수를 호출합니다.
  AppDatabase() : super(_openConnection());

  // 데이터베이스 스키마 버전 (마이그레이션 시 필요)
  @override
  int get schemaVersion => 1;
}