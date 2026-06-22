import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/app_controller.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This list stores available mobile cameras.
  // It is passed to GetX controller so camera screen can use it.
  List<CameraDescription> cameras = [];

  try {
    cameras = await availableCameras();
  } catch (e) {
    debugPrint('Camera initialization error: $e');
  }

  // Get.put() creates and stores the controller globally.
  Get.put(AppController(cameras));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Assignment',

      // Google Fonts package usage
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),

      home: const HomeScreen(),
    );
  }
}