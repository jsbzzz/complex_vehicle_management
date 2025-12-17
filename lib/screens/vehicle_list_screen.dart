import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database/AppDatabase.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({super.key});

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

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
          // 💡 새로고침 시작 알림 표시
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('데이터를 갱신하는 중입니다...'),
              duration: Duration(milliseconds: 500),
            ),
          );

          // 실시간 watch 중이므로 딜레이를 주어 사용자에게 갱신 느낌을 줌
          await Future.delayed(const Duration(milliseconds: 800));

          if (mounted) {
            setState(() {});
            // 💡 완료 알림 (선택 사항)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('새로고침 완료'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: StreamBuilder<List<VehicleTableData>>(
          stream: db.select(db.vehicleTable).watch(),
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