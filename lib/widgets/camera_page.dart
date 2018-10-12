import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(new CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => new _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<CameraDescription> cameras;
  CameraController controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _setupCameras();
  }

  Future<void> _setupCameras() async {
    try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      debugPrint(cameras.length.toString());
      await controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    setState(() {
      _isReady = true;
    });
  }

  Widget build(BuildContext context) {
    if (!_isReady) return new Container();
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child:new CameraPreview(controller)
    );
  }
}