import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart' as fp;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AppController extends GetxController {
  AppController(this.cameras);

  // Camera package cameras
  final List<CameraDescription> cameras;

  // ImagePicker object
  final ImagePicker _imagePicker = ImagePicker();

  // GetX observable variables
  final RxBool isLoading = false.obs;
  final RxList<dynamic> posts = <dynamic>[].obs;

  final RxString selectedFileName = ''.obs;
  final RxString galleryImagePath = ''.obs;
  final RxString imagePickerCameraPath = ''.obs;
  final RxString cameraPackageImagePath = ''.obs;
  final RxString message = ''.obs;

  
final Rx<Uint8List?> galleryImageBytes = Rx<Uint8List?>(null);
final Rx<Uint8List?> imagePickerCameraBytes = Rx<Uint8List?>(null);
final Rx<Uint8List?> cameraPackageImageBytes = Rx<Uint8List?>(null);

  // HTTP package usage: GET data from API
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      message.value = 'Fetching posts...';

      final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=5',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        posts.assignAll(data);
        message.value = 'Posts fetched successfully using HTTP GET';
      } else {
        message.value = 'Failed to fetch posts. Status: ${response.statusCode}';
      }
    } catch (e) {
      message.value = 'Error while fetching posts: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // File picker package usage
Future<void> pickFile() async {
  try {
    fp.FilePickerResult? result = await fp.FilePicker.pickFiles(
      type: fp.FileType.any,
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFileName.value = result.files.first.name;
      message.value = 'File selected successfully';
    } else {
      message.value = 'File selection cancelled';
    }
  } catch (e) {
    message.value = 'Error while picking file: $e';
  }
}

  // Image picker package usage: pick image from gallery
  Future<void> pickImageFromGallery() async {
  final XFile? image = await _imagePicker.pickImage(
    source: ImageSource.gallery,
  );

  if (image != null) {
    galleryImageBytes.value = await image.readAsBytes();
    message.value = 'Image picked from gallery';
  } else {
    message.value = 'Gallery image selection cancelled';
  }
}
  // Image picker package usage: take photo using image_picker
  Future<void> takePhotoUsingImagePicker() async {
  final XFile? image = await _imagePicker.pickImage(
    source: ImageSource.camera,
  );

  if (image != null) {
    imagePickerCameraBytes.value = await image.readAsBytes();
    message.value = 'Photo captured using image_picker camera';
  } else {
    message.value = 'Camera cancelled';
  }
}

  // Camera package usage: image path from custom camera screen
  void setCameraPackageImageBytes(Uint8List bytes) {
  cameraPackageImageBytes.value = bytes;
  message.value = 'Photo captured using camera package';
}