import 'package:flutter/material.dart';

import '../../../core/appData/expense_data.dart';
import '../../../core/utility/strings.dart';
import '../../../core/utility/util.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  Widget _buildStatCard(
      String title, String amount, String change, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(Util.getWidthValueInPixels(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(Util.getWidthValueInPixels(4)),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(Util.getWidthValueInPixels(6)),
                ),
                child: Icon(icon,
                    size: Util.getWidthValueInPixels(14), color: color),
              ),
              SizedBox(width: Util.getWidthValueInPixels(8)),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Util.getWidthValueInPixels(12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Util.getWidthValueInPixels(8)),
          Text(
            amount,
            style: TextStyle(
              fontSize: Util.getWidthValueInPixels(16),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            change,
            style: TextStyle(
              fontSize: Util.getWidthValueInPixels(12),
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            Strings.income,
            '${Strings.indian_rupee} ${ExpenseData.getThisMonthIncome().toStringAsFixed(0)}',
            '${Strings.indian_rupee} ${ExpenseData.getIncomeRate().toStringAsFixed(1)} ${Strings.percentage}',
            Icons.trending_up,
            Colors.green,
          ),
        ),
        SizedBox(width: Util.getWidthValueInPixels(12)),
        Expanded(
          child: _buildStatCard(
            Strings.expenses,
            '${Strings.indian_rupee} ${ExpenseData.getThisMonthSpending().toStringAsFixed(0)}',
            '${Strings.indian_rupee} ${ExpenseData.getSpendingRate().toStringAsFixed(1)} ${Strings.percentage}',
            Icons.trending_down,
            Colors.red,
          ),
        ),
        SizedBox(width: Util.getWidthValueInPixels(12)),
        Expanded(
          child: _buildStatCard(
            Strings.net,
            '${Strings.indian_rupee} ${ExpenseData.getNetSavings().toStringAsFixed(0)}',
            '${Strings.indian_rupee} ${ExpenseData.getSavingsRate().toStringAsFixed(1)} ${Strings.percentage} ${Strings.saved}',
            Icons.attach_money,
            Colors.blue,
          ),
        ),
      ],
    );
  }
}
