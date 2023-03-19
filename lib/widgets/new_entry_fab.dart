import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/new_entry.dart';

class NewEntryButton extends StatelessWidget {
  const NewEntryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

          if (pickedImage != null && context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewEntryScreen(image: File(pickedImage.path)))
            );
          }
        }
    );
  }
}