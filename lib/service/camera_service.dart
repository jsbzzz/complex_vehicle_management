import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'image_service.dart';

class CameraService {
  CameraController? _controller;
  bool _isProcessing = false; // 💡 현재 프레임 처리 중인지 확인
  DateTime? _lastProcessedTime;

  CameraController? get controller => _controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
        enableAudio: false,
        // 💡 명시적인 yuv420 지정이 에러를 유발할 수 있으므로
        // 플랫폼별로 최적의 포맷을 선택하게 합니다.
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );
      await _controller!.initialize();
    }
  }

  // 💡 스트림 기반 실시간 OCR 파이프라인 시작
  void startRealtimeOcr(ImageService ImageService, Function(String) onDetected) {
    if (_controller == null || !_controller!.value.isInitialized) return;

    const Duration processingInterval = Duration(seconds: 2);

    _controller!.startImageStream((CameraImage image) async {

      final currentTime = DateTime.now();

      // 1. 💡 시간 간격 체크: 마지막 처리 시간으로부터 설정된 간격이 지나지 않았으면 리턴
      if (_lastProcessedTime != null &&
          currentTime.difference(_lastProcessedTime!) < processingInterval) {
        return;
      }

      if (_isProcessing) return; // 💡 이전 프레임 처리 중이면 건너뜀 (가장 중요)

      _isProcessing = true;

      _lastProcessedTime = currentTime;

      try {
        final result = await ImageService.processCameraImage(image, _controller!.description.sensorOrientation);
        if (result != null && result.isNotEmpty) {
          onDetected(result);
        }
      } finally {
        _isProcessing = false; // 처리가 끝나면 다음 프레임 허용
      }
    });
  }

  void stopStreaming() {
    _controller?.stopImageStream();
  }

  void dispose() {
    _controller?.dispose();
  }
}