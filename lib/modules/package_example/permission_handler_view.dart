import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/widgets.dart';

class PermissionHandlerView extends StatelessWidget {
  const PermissionHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission Handler"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _getFromGallery(context),
          child: const Text('Pick Image'),
        ),
      ),
    );
  }
}

/// Get from gallery
_getFromGallery(context) async {
  try {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  } catch (e) {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      print('Access Denied');
      permissionDialog(context);
    } else {
      print('Exception occured!');
    }
  }
}
