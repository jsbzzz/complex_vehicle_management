import 'package:flutter/material.dart';

class VehicleSearchScreen extends StatefulWidget {
  const VehicleSearchScreen({super.key});

  @override
  State<VehicleSearchScreen> createState() => _VehicleSearchScreenState();
}

class _VehicleSearchScreenState extends State<VehicleSearchScreen> {
  bool _isSearching = false;
  bool _searchPerformed = false;
  List<String> _results = []; // 실제 구현 시 VehicleTableData 리스트로 대체

  void _onSearch() async {
    setState(() { _isSearching = true; _searchPerformed = false; });

    // 검색 시뮬레이션
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSearching = false;
      _searchPerformed = true;
      _results = []; // 결과가 없는 상황 가정
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
              decoration: InputDecoration(
                hintText: '차량 번호 또는 소유주 이름 입력',
                suffixIcon: IconButton(icon: const Icon(Icons.search), onPressed: _onSearch),
                border: const OutlineInputBorder(),
              ),
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

  Widget _buildResultList() {
    return ListView.builder(itemCount: _results.length, itemBuilder: (context, index) => ListTile(title: Text(_results[index])));
  }
}