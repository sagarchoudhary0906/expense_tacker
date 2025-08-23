import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../core/appData/expense_data.dart'; // for web fallback

class JsonStore {
  static File? _file; // native only
  static const _seed = {'data': {}};

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _file = File('${dir.path}/db.json');
    if (!await _file!.exists()) {
      await _writeAtomic(jsonEncode(_seed));
      return;
    }
    try {
      final raw = await _file!.readAsString();
      final data = jsonDecode(raw) as Map<String, dynamic>; // just validate
      ExpenseData.loadData(data);
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
