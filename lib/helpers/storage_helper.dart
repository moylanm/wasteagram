import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageHelper {
  static final FirebaseStorage _storageInstance = FirebaseStorage.instance;

  static StorageHelper? _instance;

  StorageHelper._internal() {
    _instance = this;
  }

  factory StorageHelper() => _instance ?? StorageHelper._internal();

  Future<String> uploadFile(File file) async {
    final Reference reference = _storageInstance.ref().child(basename(file.path));
    
    try {
      await reference.putFile(file);
    } on FirebaseException catch (e) {
      throw e.code;
    }

    return await reference.getDownloadURL();
  }
}