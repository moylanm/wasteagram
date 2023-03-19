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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(item.date, style: const TextStyle(fontSize: 25)),
            Image.network(item.imageURL),
            Text('Items: ${item.quantity}', style: const TextStyle(fontSize: 20)),
            Text('(${item.latitude}, ${item.longitude})')
          ],
        )
      ),
    );
  }
}