import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // for web fallback

class JsonStore {
  static File? _file; // native only
  static const _spKey = 'db_json_v1'; // web fallback key
  static const String _expenseKey = 'expense';
  static const _seed = {'data': {}};

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    print("Sagar: dir: ${dir.path}");
    _file = File('${dir.path}/db.json');

    if (!await _file!.exists()) {
      print("Sagar: file does not exist, creating it");
      await _writeAtomic(jsonEncode(_seed));
      return;
    }
    try {
      print("Sagar: file exists, reading it");
      final raw = await _file!.readAsString();
      print("Sagar: raw: $raw");
      jsonDecode(raw) as Map<String, dynamic>; // just validate
    } catch (_) {
      await _writeAtomic(jsonEncode(_seed)); // repair corrupt file
    }
  }

  static Future<Map<String, dynamic>> readDb() async {
    final raw = await _file!.readAsString();
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  static Future<void> saveDb(Map<String, dynamic> db) async {
    final contents = jsonEncode(db);
    await _writeAtomic(contents);
  }

  static Future<void> _writeAtomic(String contents) async {
    final tmp = File('${_file!.path}.tmp');
    await tmp.writeAsString(contents, flush: true);
    try {
      await tmp.rename(_file!.path);
    } on FileSystemException {
      if (await _file!.exists()) {
        await _file!.delete();
      }
      await tmp.rename(_file!.path);
    }
  }
}
