import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';
import '../data/database/AppDatabase.dart';
import '../main.dart';
import 'villager_search_delegate.dart';

class VehicleInsertScreen extends StatefulWidget {
  const VehicleInsertScreen({super.key});

  @override
  State<VehicleInsertScreen> createState() => _VehicleInsertScreenState();
}

class _VehicleInsertScreenState extends State<VehicleInsertScreen> {
  final _vNumController = TextEditingController();
  final _vModelController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _ownerPhoneController = TextEditingController();

  VillagerTableData? _selectedVillager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('차량 등록')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(controller: _vNumController, decoration: const InputDecoration(labelText: '차량 번호 (7~8자)')),
              TextField(controller: _vModelController, decoration: const InputDecoration(labelText: '차량 모델')),

              const SizedBox(height: 20),
              const Text('소유주 정보', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // 💡 입주민 정보가 연동되지 않은 경우에만 이름/번호 입력 필드 표시
              if (_selectedVillager == null) ...[
                TextField(controller: _ownerNameController, decoration: const InputDecoration(labelText: '소유주 이름 (모를 경우 비움)')),
                TextField(controller: _ownerPhoneController, decoration: const InputDecoration(labelText: '소유주 전화번호 (모를 경우 비움)')),
              ] else ...[
                // 💡 입주민이 연동된 경우 요약 정보 표시
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('연동된 입주민: ${_selectedVillager!.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('주소: ${_selectedVillager!.addr}'),
                      Text('전화번호: ${_selectedVillager!.phoneNumber}'),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 15),

              // 입주민 연동 버튼
              OutlinedButton.icon(
                icon: const Icon(Icons.person_search),
                label: Text(_selectedVillager == null ? '기존 입주민 연동하기' : '다른 입주민으로 변경'),
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VillagerSearchDelegate())
                  );
                  if (result != null) setState(() => _selectedVillager = result);
                },
              ),
              if (_selectedVillager != null)
                TextButton(
                    onPressed: () => setState(() => _selectedVillager = null),
                    child: const Text('연동 취소 (방문 차량으로 등록)')
                ),

              const SizedBox(height: 30),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _saveVehicle,
                      child: const Text('차량 정보 저장')
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveVehicle() async {
    final db = Provider.of<AppDatabase>(context, listen: false);

    await db.into(db.vehicleTable).insert(
      VehicleTableCompanion.insert(
        vehicleNumber: _vNumController.text,
        vehicleModel: _vModelController.text,
        // 입주민 연동 시 입주민의 이름을, 아니면 입력필드의 이름을 저장
        ownerName: Value(_selectedVillager?.name ?? _ownerNameController.text),
        ownerPhone: Value(_selectedVillager?.phoneNumber ?? _ownerPhoneController.text),
        // 핵심: villagerId 유무로 입주민/방문차량 구분
        villagerId: Value(_selectedVillager?.id),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('차량이 등록되었습니다.')));

      // 💡 입력 필드 초기화
      // _vNumController.clear();
      // _vModelController.clear();
      // _ownerNameController.clear();
      // _ownerPhoneController.clear();
      // _selectedVillager = null;

      // 💡 0번 탭(조회 화면)으로 이동
      mainNavKey.currentState?.changeTab(0);
    }
  }
}