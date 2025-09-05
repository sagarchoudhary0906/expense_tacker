import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/appData/category_data.dart';
import '../../../core/utility/strings.dart';
import '../../../core/utility/util.dart';

class SpendingOverviewWidget extends StatefulWidget {
  SpendingOverviewWidget({super.key});
  String overviewPeriod = 'monthly';

  @override
  State<SpendingOverviewWidget> createState() => _SpendingOverviewWidgetState();
}

class _SpendingOverviewWidgetState extends State<SpendingOverviewWidget>
    with SingleTickerProviderStateMixin {
  // Source data (kept here so it can be reused by pie + list)
  final List<Map<String, dynamic>> _monthlyData = [
    {'categoryId': 'food', 'amount': 520.0, 'percentage': 31.4},
    {'categoryId': 'transportation', 'amount': 320.0, 'percentage': 19.3},
    {'categoryId': 'shopping', 'amount': 450.0, 'percentage': 27.2},
    {'categoryId': 'entertainment', 'amount': 180.0, 'percentage': 10.9},
    {'categoryId': 'bills', 'amount': 184.5, 'percentage': 11.2},
  ];

  late final AnimationController _controller;
  late final Animation<double> _reveal;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _reveal = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _totalAmount =>
      _monthlyData.fold(0.0, (sum, item) => sum + (item['amount'] as double));

  List<PieChartSectionData> _buildSections(double t) {
    return _monthlyData.map((data) {
      final category =
          CategoryConfig.getCategoryById(data['categoryId'] as String);
      final value = (data['percentage'] as double);
      final color = category?.color ?? Colors.grey;
      return PieChartSectionData(
        // sweep grows from 0% to actual value
        value: value * t,
        color: color,
        title: t > 0.95 ? '${value.toStringAsFixed(0)}%' : '',
        // slight radius growth for a nicer "bloom" effect
        radius: Util.getWidthValueInPixels(34) * (0.85 + 0.15 * t),
        titleStyle: TextStyle(
          fontSize: Util.getWidthValueInPixels(10),
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Widget _buildPieChart() {
    return SizedBox(
      height: Util.getWidthValueInPixels(200),
      child: AnimatedBuilder(
        animation: _reveal,
        builder: (context, _) {
          final t = _reveal.value;
          // subtle spin during reveal (from -90 - 220deg back to -90)
          final startDeg = -90 + 220 * (1 - t);
          return Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: startDeg,
                  sectionsSpace: Util.getWidthValueInPixels(2),
                  centerSpaceRadius: Util.getWidthValueInPixels(48),
                  borderData: FlBorderData(show: false),
                  sections: _buildSections(t),
                ),
                // let our controller drive the animation instead of swapAnimation
                swapAnimationDuration: Duration.zero,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: Util.getWidthValueInPixels(12),
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    '${Strings.indian_rupee} ${_totalAmount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: Util.getWidthValueInPixels(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
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
            blurRadius: Util.getWidthValueInPixels(10),
            spreadRadius: Util.getWidthValueInPixels(2),
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
                'Spending Overview',
                style: TextStyle(
                  fontSize: Util.getWidthValueInPixels(18),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  _buildPeriodButton('Monthly', 'monthly'),
                  SizedBox(width: Util.getWidthValueInPixels(4)),
                  _buildPeriodButton('Yearly', 'yearly'),
                ],
              ),
            ],
          ),
          SizedBox(height: Util.getWidthValueInPixels(16)),
          _buildPieChart(),
          SizedBox(height: Util.getWidthValueInPixels(16)),
          ..._buildCategoryList(),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String text, String period) {
    final isSelected = widget.overviewPeriod == period;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.overviewPeriod = period;
        });
        // retrigger the entry animation on period change
        _controller.forward(from: 0);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Util.getWidthValueInPixels(12),
            vertical: Util.getWidthValueInPixels(4)),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: Util.getWidthValueInPixels(4),
                    spreadRadius: Util.getWidthValueInPixels(1),
                  ),
                ]
              : [],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Util.getWidthValueInPixels(12),
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected ? Colors.black : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCategoryList() {
    return _monthlyData.map((data) {
      final category =
          CategoryConfig.getCategoryById(data['categoryId'] as String);
      if (category == null) return SizedBox.shrink();

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
              padding: EdgeInsets.all(Util.getWidthValueInPixels(8)),
              decoration: BoxDecoration(
                color: category.bgColor,
                borderRadius:
                    BorderRadius.circular(Util.getWidthValueInPixels(8)),
              ),
              child: Icon(
                category.icon,
                size: Util.getWidthValueInPixels(16),
                color: category.color,
              ),
            ),
            SizedBox(width: Util.getWidthValueInPixels(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: Util.getWidthValueInPixels(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: Util.getWidthValueInPixels(4)),
                      Text(category.emoji,
                          style: TextStyle(
                              fontSize: Util.getWidthValueInPixels(12))),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${Strings.indian_rupee} ${(data['amount'] as double).toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: Util.getWidthValueInPixels(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${(data['percentage'] as double).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: Util.getWidthValueInPixels(12),
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }
}
