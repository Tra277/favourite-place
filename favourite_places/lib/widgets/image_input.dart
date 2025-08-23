import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? _selectedImage;
  void _takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(child: 
        TextButton.icon(onPressed: _takeImage, label: const Text('Add Image'), icon: const Icon(Icons.camera_alt),)
      ,),
    );

    if(_selectedImage != null) {
      content = GestureDetector(
        onTap: _takeImage,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
        ),
      );
    }
    return content;
  }
}