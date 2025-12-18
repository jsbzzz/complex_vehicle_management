import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database/AppDatabase.dart';
import '../repository/vehicle_repository.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<VehicleRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('차량 목록 조회'),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
        ],
      ),
      // 수동 새로고침을 위한 RefreshIndicator
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            // 💡 수동 새로고침 시 원격에 요청을 보냄
            await repository.syncAllFromRemote();
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('서버와 동기화되었습니다.'))
              );
            }
          } catch (e) {
            print("동기화 에러 발생: $e");

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('동기화 실패: 네트워크 상태를 확인하세요.'))
              );
            }
          }
        },
        child: StreamBuilder<List<VehicleTableData>>(
          stream: repository.watchVehicles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('등록된 차량이 없습니다. (당겨서 새로고침)'));
            }

            final vehicles = snapshot.data!;
            return _isGridView ? _buildGridView(vehicles) : _buildListView(vehicles);
          },
        ),
      ),
    );
  }

  Widget _buildListView(List<VehicleTableData> vehicles) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text(vehicles[index].vehicleNumber),
        subtitle: Text('${vehicles[index].vehicleModel} / ${vehicles[index].ownerName ?? "방문차량"}'),
      ),
    );
  }

  Widget _buildGridView(List<VehicleTableData> vehicles) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
      itemCount: vehicles.length,
      itemBuilder: (context, index) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_car),
            Text(vehicles[index].vehicleNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(vehicles[index].ownerName ?? "방문차량", style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}