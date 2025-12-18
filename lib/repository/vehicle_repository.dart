// lib/data/repository/vehicle_repository.dart
import 'package:drift/drift.dart';
import '../data/database/AppDatabase.dart';
import '../data/remote/remote_database.dart';

class VehicleRepository {
  final AppDatabase db;
  final RemoteDataBase remoteDataBase; // 추상화된 원격 소스 주입

  VehicleRepository({required this.db, required this.remoteDataBase});

  // 1. 기본 조회: 로컬 DB를 실시간으로 감시 (사용자는 항상 로컬을 봄)
  Stream<List<VehicleTableData>> watchVehicles() {
    return db.select(db.vehicleTable).watch();
  }

  // 2. 전체 데이터 동기화 (원격 -> 로컬)
  Future<void> syncAllFromRemote() async {
    // 원격에서 데이터 가져오기 (추상화된 메서드 호출)
    final remoteData = await remoteDataBase.fetchAllVehicles();

    // 로컬 DB 갱신 (Transaction 사용 권장)
    await db.batch((batch) {
      // 기존 데이터를 지우거나 업데이트하는 로직
      for (var data in remoteData) {
        batch.insert(
            db.vehicleTable,
            data,
            mode: InsertMode.insertOrReplace // 중복 시 덮어쓰기
        );
      }
    });
  }

  // 3. 데이터 등록 (로컬 저장 후 원격 전송 시도)
  Future<void> registerVehicle(VehicleTableCompanion vehicle) async {
    // 로컬에 먼저 저장하여 즉각적인 UI 반응성 확보
    final id = await db.into(db.vehicleTable).insert(vehicle);

    // 저장된 데이터 전체를 가져와 원격에 백업 시도 (비동기)
    final savedData = await (db.select(db.vehicleTable)..where((t) => t.vehicleId.equals(id))).getSingle();
    try {
      await remoteDataBase.uploadVehicle(savedData);
    } catch (e) {
      // 원격 저장 실패 시 로컬에 '미동기화' 상태 표시 등의 추가 처리가 가능합니다.
      print("원격 저장 실패: $e");
    }
  }
}