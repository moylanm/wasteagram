import 'package:flutter/material.dart';
import 'package:wasteagram/models/entry.dart';

class EntryDetailScreen extends StatelessWidget {
  final Entry item;

  const EntryDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram')),
      body: Center(
        child: Column(
          children: [
            Text(item.date),
            
          ],
        )
      ),
    );
  }
}