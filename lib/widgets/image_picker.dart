import 'dart:io';

import 'package:flutter/material.dart';
import "package:image_picker/image_picker.dart";

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key, required this.onImageSelect});

  final void Function(File pickedImage) onImageSelect;

  @override
  State<StatefulWidget> createState() {
    return ImagePickerState();
  }
}

class ImagePickerState extends State<ImagePickerScreen> {
  File? _imageFile;

  void _pickedImage() async {
    final _pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 150, imageQuality: 80);
    if (_pickedImage == null) {
      return;
    }

    setState(() {
      _imageFile = File(_pickedImage.path);
    });

    widget.onImageSelect(_imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.purple,
          foregroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
        ),
        TextButton.icon(
            onPressed: _pickedImage,
            icon: const Icon(
              Icons.image,
              color: Colors.purple,
            ),
            label: const Text(
              "Add Image",
              style: TextStyle(fontSize: 12, color: Colors.purple),
            ))
      ],
    );
  }
}
