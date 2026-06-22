import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import 'camera_screen.dart';

class HomeScreen extends GetView<AppController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media & API Manager'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Flutter State Management Assignment',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'This app demonstrates GetX, HTTP, File Picker, Camera, Image Picker, and Google Fonts.',
            ),

            const SizedBox(height: 20),

            _sectionTitle('Actions'),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _actionButton(
                  icon: Icons.cloud_download,
                  label: 'HTTP GET',
                  onPressed: controller.fetchPosts,
                ),
                _actionButton(
                  icon: Icons.attach_file,
                  label: 'Pick File',
                  onPressed: controller.pickFile,
                ),
                _actionButton(
                  icon: Icons.image,
                  label: 'Pick Gallery Image',
                  onPressed: controller.pickImageFromGallery,
                ),
                _actionButton(
                  icon: Icons.camera_alt,
                  label: 'Image Picker Camera',
                  onPressed: controller.takePhotoUsingImagePicker,
                ),
                _actionButton(
                  icon: Icons.camera,
                  label: 'Camera Package',
                  onPressed: () {
                    Get.to(() => const CameraScreen());
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (controller.message.value.isNotEmpty)
              _infoCard(controller.message.value),

            _sectionTitle('Selected File'),
            _infoCard(
              controller.selectedFileName.value.isEmpty
                  ? 'No file selected'
                  : controller.selectedFileName.value,
            ),

            _sectionTitle('Gallery Image using image_picker'),
            _imagePreview(controller.galleryImagePath.value),

            _sectionTitle('Camera using image_picker'),
            _imagePreview(controller.imagePickerCameraPath.value),

            _sectionTitle('Camera using camera package'),
            _imagePreview(controller.cameraPackageImagePath.value),

            _sectionTitle('HTTP GET API Data'),

            if (controller.isLoading.value)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (controller.posts.isEmpty)
              _infoCard('No API data loaded. Click HTTP GET.')
            else
              ...controller.posts.map(
                (post) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${post['id']}'),
                    ),
                    title: Text(
                      '${post['title']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '${post['body']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget _infoCard(String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(text),
      ),
    );
  }

  Widget _imagePreview(String imagePath) {
    if (imagePath.isEmpty) {
      return _infoCard('No image selected/captured');
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Image.file(
        File(imagePath),
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}