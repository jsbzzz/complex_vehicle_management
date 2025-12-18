// lib/data/remote/remote_data_source.dart
import '../database/AppDatabase.dart';

/// 원격 저장소와의 통신을 정의하는 추상 클래스 (인터페이스 역할)
abstract class RemoteDataBase {
  // 모든 차량 데이터를 서버에서 가져옴
  Future<List<VehicleTableData>> fetchAllVehicles();

  // 특정 차량 정보를 서버에 업로드
  Future<void> uploadVehicle(VehicleTableData vehicle);

  // 마지막 업데이트 이후의 변경된 데이터만 가져오기 (증분 갱신용)
  Future<List<VehicleTableData>> fetchUpdatedVehicles(DateTime lastSyncTime);
}

