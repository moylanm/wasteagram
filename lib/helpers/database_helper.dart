import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  static DatabaseHelper? _instance;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  Future<void> addEntry(Map<String, dynamic> entry) async {
    await _firestoreInstance.collection('posts').add(entry);
  }
}