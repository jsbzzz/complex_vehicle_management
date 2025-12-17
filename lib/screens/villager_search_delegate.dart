import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database/AppDatabase.dart';

class VillagerSearchDelegate extends StatefulWidget {
  const VillagerSearchDelegate({super.key});

  @override
  State<VillagerSearchDelegate> createState() => _VillagerSearchDelegateState();
}

class _VillagerSearchDelegateState extends State<VillagerSearchDelegate> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('입주민 검색 및 선택'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '이름, 전화번호, 주소로 검색',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<VillagerTableData>>(
        stream: db.select(db.villagerTable).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          // 선택적 정보(이름, 번호, 주소)를 포함하는 검색 필터링
          final filtered = snapshot.data!.where((v) =>
          v.name.contains(_query) ||
              v.phoneNumber.contains(_query) ||
              v.addr.contains(_query)
          ).toList();

          if (filtered.isEmpty) return const Center(child: Text('일치하는 입주민 정보가 없습니다.'));

          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final villager = filtered[index];
              return ListTile(
                title: Text(villager.name),
                subtitle: Text('${villager.addr} / ${villager.phoneNumber}'),
                onTap: () => Navigator.pop(context, villager), // 선택된 데이터 반환
              );
            },
          );
        },
      ),
    );
  }
}