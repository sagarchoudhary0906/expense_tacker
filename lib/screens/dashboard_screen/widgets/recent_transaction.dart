import 'package:flutter/material.dart';

import '../../../core/utility/strings.dart';
import '../../../core/utility/util.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  Widget _buildTransactionItem(String title, String subtitle, String amount,
      IconData icon, Color color, String emoji) {
    return Container(
      padding: EdgeInsets.all(Util.getWidthValueInPixels(12)),
      margin: EdgeInsets.only(bottom: Util.getWidthValueInPixels(8)),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(8)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Util.getWidthValueInPixels(12)),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          SizedBox(width: Util.getWidthValueInPixels(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Util.getWidthValueInPixels(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: Util.getWidthValueInPixels(4)),
                    Text(emoji,
                        style: TextStyle(
                            fontSize: Util.getWidthValueInPixels(12))),
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: Util.getWidthValueInPixels(12),
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: Util.getWidthValueInPixels(16),
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Util.getWidthValueInPixels(16)),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: Util.getWidthValueInPixels(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: Util.getWidthValueInPixels(14),
                ),
              ),
            ],
          ),
          SizedBox(height: Util.getWidthValueInPixels(16)),
          _buildTransactionItem(
            'Monthly Salary',
            'Today • 9:00 AM • Salary',
            '+${Strings.indian_rupee} 3,500',
            Icons.trending_up,
            Colors.green,
            '💼',
          ),
          _buildTransactionItem(
            'Coffee Shop',
            'Today • 2:30 PM • Food & Dining',
            '-${Strings.indian_rupee} 8.50',
            Icons.restaurant,
            Colors.red,
            '🍽️',
          ),
          _buildTransactionItem(
            'Gas Station',
            'Yesterday • 4:15 PM • Transportation',
            '-${Strings.indian_rupee} 45.20',
            Icons.directions_car,
            Colors.blue,
            '🚗',
          ),
        ],
      ),
    );
  }
}
