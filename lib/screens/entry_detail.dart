import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EntryDetailScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> item;

  const EntryDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wasteagram')),
      body: Center(
        child: Column(
          children: [
            
          ],
        )
      ),
    );
  }
}