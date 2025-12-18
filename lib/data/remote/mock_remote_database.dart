import '../database/AppDatabase.dart';
import 'remote_database.dart';

class MockRemoteDataBase implements RemoteDataBase {
  // 실제 서버 DB 대신 메모리에 임시로 저장할 리스트
  final List<VehicleTableData> _mockServerStorage = [
    VehicleTableData(
      vehicleId: 999,
      vehicleNumber: '서울12가3456',
      vehicleModel: '원격아반떼',
      ownerName: '서버관리자',
      ownerPhone: '010-9999-9999',
    ),
  ];

  @override
  Future<List<VehicleTableData>> fetchAllVehicles() async {
    // 💡 네트워크 지연 시뮬레이션 (1초)
    await Future.delayed(const Duration(seconds: 1));
    print("원격 서버로부터 모든 차량 데이터를 가져왔습니다.");
    return _mockServerStorage;
  }

  @override
  Future<void> uploadVehicle(VehicleTableData vehicle) async {
    // 💡 네트워크 지연 시뮬레이션
    await Future.delayed(const Duration(milliseconds: 500));
    _mockServerStorage.add(vehicle);
    print("원격 서버에 차량 정보를 업로드했습니다: ${vehicle.vehicleNumber}");
  }

  @override
  Future<List<VehicleTableData>> fetchUpdatedVehicles(DateTime lastSyncTime) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return []; // 테스트용이므로 빈 리스트 반환
  }
}