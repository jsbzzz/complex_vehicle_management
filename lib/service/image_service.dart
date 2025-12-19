import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:developer' as dev;

// 💡 클래스명을 ImageService로 유지하거나 OcrService로 통일하세요.
// 여기서는 파일명에 맞춰 ImageService로 제안합니다.
class ImageService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);

  Future<String?> processCameraImage(CameraImage image, int sensorOrientation) async {

    final inputImage=_convertCameraImageToInputImage(image, sensorOrientation);

    if(inputImage==null)return null;
    final recognizedText = await _textRecognizer.processImage(inputImage);
    return _extractVehicleNumber(recognizedText.text);
  }

  InputImage? _convertCameraImageToInputImage(CameraImage image, int sensorOrientation) {
    try {

      final plane = image.planes.first;
      final WriteBuffer allBytes = WriteBuffer();
      for (final Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }

      final bytes = allBytes.done().buffer.asUint8List();

      final imageRotation = InputImageRotationValue.fromRawValue(sensorOrientation)
          ?? InputImageRotation.rotation0deg;

      // 💡 중요: NV21 대신 기기 원본 포맷(image.format.raw)을 사용하거나
      // 호환성이 가장 높은 yuv420을 다시 명시합니다.
      final inputImageFormat = Platform.isAndroid
          ? InputImageFormat.nv21
          : InputImageFormat.bgra8888;

      final metadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: plane.bytesPerRow,
      );

      return InputImage.fromBytes(bytes: bytes, metadata: metadata);
    } catch (e) {
      debugPrint("이미지 변환 실패: $e");
      return null;
    }
  }

  String? _extractVehicleNumber(String text) {
    // final RegExp regExp = RegExp(r'\d{2,3}\s?[가-힣]\s?\d{4}');
    // final match = regExp.firstMatch(text.replaceAll('\n', ' '));
    // return match?.group(0);
    return text;
  }

  void dispose() => _textRecognizer.close();
}