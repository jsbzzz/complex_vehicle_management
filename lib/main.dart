import 'package:complex_vehicle_management/repository/vehicle_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/database/AppDatabase.dart';
import 'data/remote/mock_remote_database.dart';
import 'screens/vehicle_list_screen.dart';
import 'screens/vehicle_search_screen.dart';
import 'screens/vehicle_insert_screen.dart';

void main() {

  // 1. Database 인스턴스 생성
  final db = AppDatabase();
  final remoteDataBase = MockRemoteDataBase();
  runApp(
      MultiProvider(
        providers: [
          // 2. Database 공급
          Provider<AppDatabase>.value(value: db),
          // 3. Database를 주입받는 Repository 공급
          ProxyProvider<AppDatabase, VehicleRepository>(
            update: (_, db, __) => VehicleRepository(db: db, remoteDataBase: remoteDataBase),
          ),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Vehicle Management',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: MainNavigationScreen(),
    );
  }
}

final GlobalKey<MainNavigationScreenState> mainNavKey = GlobalKey<MainNavigationScreenState>();

class MainNavigationScreen extends StatefulWidget {
  MainNavigationScreen() : super(key: mainNavKey);

  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const VehicleListScreen(),
    const VehicleSearchScreen(),
    const VehicleInsertScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '조회'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: '등록'),
        ],
      ),
    );
  }
}