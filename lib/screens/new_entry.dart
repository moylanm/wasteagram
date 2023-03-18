import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewEntryScreen extends StatefulWidget {
  final XFile image;

  const NewEntryScreen({super.key, required this.image});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram')),
      body: Placeholder(),
    );
  }
}