import '../../localDataStorage/jsonStore.dart';
import '../utility/strings.dart';

class ExpenseData {
  static bool isIntroDone = false;
  static double currentBalance = 0;
  static double thisMonthIncome = 0;
  static double thisMonthSpending = 0;
  static double thisMonthSavings = 0;
  static double netSavings = 0;
  static double savingsRate = 0;

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

  static double getCurrentBalance() {
    return currentBalance;
  }

  static double getThisMonthSavings() {
    return thisMonthSavings;
  }

  static double getThisMonthIncome() {
    return thisMonthIncome;
  }

  static double getThisMonthSpending() {
    return thisMonthSpending;
  }

  static double getNetSavings() {
    return getThisMonthIncome() - getThisMonthSpending();
  }

  static double getSavingsRate() {
    double thisMonthIncome = getThisMonthIncome();
    double thisMonthSpending = getThisMonthSpending();
    if (thisMonthIncome == 0) {
      return 0;
    }
    return (thisMonthSpending / thisMonthIncome) * 100;
  }

  static double getIncomeRate() {
    double currentBalance = getCurrentBalance();
    double thisMonthIncome = getThisMonthIncome();
    if (currentBalance == 0) {
      return 0;
    }
    return (thisMonthIncome / currentBalance) * 100;
  }

  static double getSpendingRate() {
    double currentBalance = getCurrentBalance();
    double thisMonthSpending = getThisMonthSpending();
    if (currentBalance == 0) {
      return 0;
    }
    return (thisMonthSpending / currentBalance) * 100;
  }
}
