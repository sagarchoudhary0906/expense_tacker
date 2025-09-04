import 'package:flutter/material.dart';

import '../../../core/appData/expense_data.dart';
import '../../../core/utility/strings.dart';
import '../../../core/utility/util.dart';

class BalanceCardWidget extends StatefulWidget {
  BalanceCardWidget({super.key});
  bool showBalance = true;
  final double currentBalance = 28456969087097.50;

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.getFullScreenWidth(),
      padding: EdgeInsets.all(Util.getWidthValueInPixels(24)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Util.getWidthValueInPixels(8)),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    //TODO: SAGAR THIS CAN CHANGE ACCORDING TO THE CURRENCY SELECTED FROM SETTINGS
                    child: const Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: Util.getWidthValueInPixels(8)),
                  Text(
                    Strings.currentBalance,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.showBalance = !widget.showBalance;
                  });
                },
                child: Icon(
                  widget.showBalance ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
          // Space
          SizedBox(height: Util.getWidthValueInPixels(16)),
          // Balance Text
          Text(
            widget.showBalance
                ? ExpenseData.getCurrentBalance()
                : Strings.hiddenBalance,
            style: TextStyle(
              fontSize: Util.getWidthValueInPixels(32),
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          // Space
          SizedBox(height: Util.getWidthValueInPixels(8)),

          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.white.withOpacity(0.9),
                size: 14,
              ),
              SizedBox(width: Util.getWidthValueInPixels(4)),
              Text(
                Strings.thisMonth,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: Util.getWidthValueInPixels(14),
                ),
              ),
              SizedBox(width: Util.getWidthValueInPixels(16)),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Util.getWidthValueInPixels(12),
                    vertical: Util.getWidthValueInPixels(4)),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${ExpenseData.getThisMonthSavings()}${Strings.percentage} ${Strings.saved}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Util.getWidthValueInPixels(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
