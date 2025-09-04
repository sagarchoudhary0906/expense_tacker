import 'package:expense_tracker/core/utility/util.dart';
import 'package:flutter/material.dart';

import '../../core/utility/profile_data.dart';
import 'widgets/balance_card_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/stats_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool showBalance = true;
  String overviewPeriod = 'monthly';

  //TODO: SAGAR CORRECT THIS
  final double currentBalance = 2845.50;
  final double thisMonthIncome = 4200;
  final double thisMonthSpending = 1654.50;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final netSavings = thisMonthIncome - thisMonthSpending;
    final savingsRate = ((netSavings / thisMonthIncome) * 100);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(16)),
      child: Column(
        children: [
          // Header
          const DashboardHeaderWidget(),
          // Sized box for spacing
          SizedBox(height: Util.getWidthValueInPixels(24)),
          // Balance Card Widget
          BalanceCardWidget(),
          SizedBox(height: Util.getWidthValueInPixels(24)),
          // Stats Widget
          const StatsWidget(),
        ],
      ),
    );
  }
}
