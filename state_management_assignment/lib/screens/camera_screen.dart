import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final AppController appController = Get.find<AppController>();

  CameraController? cameraController;
  Future<void>? initializeCameraFuture;

  @override
  void initState() {
    super.initState();

    // Check whether device has camera.
    if (appController.cameras.isNotEmpty) {
      cameraController = CameraController(
        appController.cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      initializeCameraFuture = cameraController!.initialize();
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> captureImage() async {
    try {
      await initializeCameraFuture;

      final XFile image = await cameraController!.takePicture();

      // Store captured image path in GetX controller.
      appController.setCameraPackageImage(image.path);

      Get.back();
    } catch (e) {
      Get.snackbar(
        'Camera Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Camera Package'),
        ),
        body: const Center(
          child: Text('No camera found on this device'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Package'),
      ),
      body: FutureBuilder<void>(
        future: initializeCameraFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(cameraController!),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton.icon(
                    onPressed: captureImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Capture Photo'),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}