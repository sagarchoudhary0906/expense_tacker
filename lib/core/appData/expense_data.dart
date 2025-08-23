import '../../localDataStorage/jsonStore.dart';

class ExpenseData {
  static bool isIntroDone = false;

  static void loadData(Map<String, dynamic> expenseData) {
    var data = expenseData["data"];
    isIntroDone = data['isIntroDone'] ?? false;
  }

  static void saveData() async {
    final db = await JsonStore.readDb();
    final data = Map<String, dynamic>.from(db['data'] as Map? ?? {});

    data['isIntroDone'] = isIntroDone;

    db['data'] = data;
    await JsonStore.saveDb(db);
  }

  static void setIsIntroDone(bool value) {
    isIntroDone = value;
  }
}
