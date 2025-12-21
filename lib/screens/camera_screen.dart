import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import '../service/camera_service.dart';
import '../service/image_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  final ImageService _imageService = ImageService();

  // 💡 인식된 결과를 담을 리스트
  final List<String> _detectedResults = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    await _cameraService.initialize();
    if (mounted) {
      setState(() {});
      // 💡 실시간 OCR 파이프라인 시작
      _cameraService.startRealtimeOcr(_imageService, (number) {
        if (!_detectedResults.contains(number)) {
          setState(() {
            // 새로운 번호인 경우 리스트 맨 앞에 추가
            _detectedResults.insert(0, number);
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _imageService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _cameraService.controller;

    if (controller == null || !controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('실시간 번호판 인식')),
      body: Column(
        children: [
          // 1. 화면 상단 반절: 카메라 프리뷰
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),

          // 2. 화면 하단 반절: 인식된 내용 리스트
          Expanded(
            flex: 1,
            child: _buildResultList(),
          ),
        ],
      ),
    );
  }

  // 💡 인식된 결과를 보여주는 리스트 위젯
  Widget _buildResultList() {
    if (_detectedResults.isEmpty) {
      return const Center(child: Text('번호판을 인식 중입니다...'));
    }

    return ListView.builder(
      itemCount: _detectedResults.length,
      itemBuilder: (context, index) {
        final result = _detectedResults[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: const Icon(Icons.vignette_outlined),
            title: Text(result, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: const Text('터치하여 선택'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 💡 클릭 시 토스트 메시지(SnackBar) 표시
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$result 차량이 선택되었습니다.'),
                  duration: const Duration(seconds: 1),
                ),
              );

              // 나중에 여기에 Navigator.pop(context, result); 를 넣어
              // 등록 화면으로 데이터를 넘겨줄 수 있습니다.
            },
          ),
        );
      },
    );
  }
}