import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database/AppDatabase.dart';
import '../repository/vehicle_repository.dart';

class VehicleSearchScreen extends StatefulWidget {
  const VehicleSearchScreen({super.key});

  @override
  State<VehicleSearchScreen> createState() => _VehicleSearchScreenState();
}

class _VehicleSearchScreenState extends State<VehicleSearchScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;
  bool _searchPerformed = false;
  List<VehicleTableData> _results = []; // 💡 String에서 실제 데이터 타입으로 변경

  void _onSearch() async {
    if (_searchController.text.isEmpty) return;

    setState(() { _isSearching = true; _searchPerformed = false; });

    // 💡 레포지토리에서 데이터를 가져와 메모리 내 필터링 시뮬레이션
    final repository = Provider.of<VehicleRepository>(context, listen: false);

    // 실시간 watch가 아닌 일회성 조회를 위해 스트림의 첫 번째 값을 기다립니다.
    final allVehicles = await repository.watchVehicles().first;

    final query = _searchController.text;
    final filtered = allVehicles.where((v) =>
    v.vehicleNumber.contains(query) || (v.ownerName?.contains(query) ?? false)
    ).toList();

    // 검색 느낌을 주기 위한 짧은 딜레이
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _isSearching = false;
      _searchPerformed = true;
      _results = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('차량 통합 검색')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '차량 번호 또는 소유주 이름 입력',
                suffixIcon: IconButton(icon: const Icon(Icons.search), onPressed: _onSearch),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
          ),
          Expanded(
            child: _isSearching
                ? _buildLoadingWidget()
                : (_searchPerformed && _results.isEmpty ? _buildNoResultWidget() : _buildResultList()),
          ),
        ],
      ),
    );
  }

  Widget _buildResultList() {
    return ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final vehicle = _results[index];
          return ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text(vehicle.vehicleNumber),
            subtitle: Text('${vehicle.vehicleModel} / ${vehicle.ownerName ?? "방문차량"}'),
          );
        }
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('데이터베이스에서 검색 중입니다...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildNoResultWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.redAccent),
          SizedBox(height: 16),
          Text('일치하는 검색 결과가 없습니다.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('입력하신 정보를 다시 한번 확인해 주세요.', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }


}