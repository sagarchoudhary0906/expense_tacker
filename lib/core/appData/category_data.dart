import 'package:flutter/material.dart';

class CategoryData {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Color lightBgColor;
  final Color darkColor;
  final String emoji;

  CategoryData({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.lightBgColor,
    required this.darkColor,
    required this.emoji,
  });
}

class CategoryConfig {
  static final List<CategoryData> expenseCategories = [
    CategoryData(
      id: 'food',
      name: 'Food & Dining',
      icon: Icons.restaurant,
      color: Color(0xFFEF4444),
      bgColor: Color(0xFFFEE2E2),
      lightBgColor: Color(0xFFFEF2F2),
      darkColor: Color(0xFFDC2626),
      emoji: '🍽️',
    ),
    CategoryData(
      id: 'transportation',
      name: 'Transportation',
      icon: Icons.directions_car,
      color: Color(0xFF3B82F6),
      bgColor: Color(0xFFDBEAFE),
      lightBgColor: Color(0xFFEFF6FF),
      darkColor: Color(0xFF2563EB),
      emoji: '🚗',
    ),
    CategoryData(
      id: 'shopping',
      name: 'Shopping',
      icon: Icons.shopping_bag,
      color: Color(0xFFA855F7),
      bgColor: Color(0xFFE9D5FF),
      lightBgColor: Color(0xFFF3E8FF),
      darkColor: Color(0xFF9333EA),
      emoji: '🛍️',
    ),
    CategoryData(
      id: 'entertainment',
      name: 'Entertainment',
      icon: Icons.sports_esports,
      color: Color(0xFFEC4899),
      bgColor: Color(0xFFFCE7F3),
      lightBgColor: Color(0xFFFDF2F8),
      darkColor: Color(0xFFDB2777),
      emoji: '🎮',
    ),
    CategoryData(
      id: 'bills',
      name: 'Bills & Utilities',
      icon: Icons.flash_on,
      color: Color(0xFFF59E0B),
      bgColor: Color(0xFFFEF3C7),
      lightBgColor: Color(0xFFFFFBEB),
      darkColor: Color(0xFFD97706),
      emoji: '⚡',
    ),
    CategoryData(
      id: 'healthcare',
      name: 'Healthcare',
      icon: Icons.local_hospital,
      color: Color(0xFF10B981),
      bgColor: Color(0xFFD1FAE5),
      lightBgColor: Color(0xFFECFDF5),
      darkColor: Color(0xFF059669),
      emoji: '🏥',
    ),
    CategoryData(
      id: 'education',
      name: 'Education',
      icon: Icons.school,
      color: Color(0xFF6366F1),
      bgColor: Color(0xFFE0E7FF),
      lightBgColor: Color(0xFFEEF2FF),
      darkColor: Color(0xFF4F46E5),
      emoji: '📚',
    ),
    CategoryData(
      id: 'housing',
      name: 'Housing',
      icon: Icons.home,
      color: Color(0xFF8B5CF6),
      bgColor: Color(0xFFE9D5FF),
      lightBgColor: Color(0xFFF3E8FF),
      darkColor: Color(0xFF7C3AED),
      emoji: '🏠',
    ),
    CategoryData(
      id: 'clothing',
      name: 'Clothing',
      icon: Icons.checkroom,
      color: Color(0xFF06B6D4),
      bgColor: Color(0xFFCFFAFE),
      lightBgColor: Color(0xFFECFEFF),
      darkColor: Color(0xFF0891B2),
      emoji: '👕',
    ),
    CategoryData(
      id: 'travel',
      name: 'Travel',
      icon: Icons.flight,
      color: Color(0xFF84CC16),
      bgColor: Color(0xFFDCFCE7),
      lightBgColor: Color(0xFFF0FDF4),
      darkColor: Color(0xFF65A30D),
      emoji: '✈️',
    ),
  ];

  static final List<CategoryData> incomeCategories = [
    CategoryData(
      id: 'salary',
      name: 'Salary',
      icon: Icons.work,
      color: Color(0xFF10B981),
      bgColor: Color(0xFFD1FAE5),
      lightBgColor: Color(0xFFECFDF5),
      darkColor: Color(0xFF059669),
      emoji: '💼',
    ),
    CategoryData(
      id: 'freelance',
      name: 'Freelance',
      icon: Icons.people,
      color: Color(0xFF3B82F6),
      bgColor: Color(0xFFDBEAFE),
      lightBgColor: Color(0xFFEFF6FF),
      darkColor: Color(0xFF2563EB),
      emoji: '👥',
    ),
    CategoryData(
      id: 'investments',
      name: 'Investments',
      icon: Icons.trending_up,
      color: Color(0xFF8B5CF6),
      bgColor: Color(0xFFE9D5FF),
      lightBgColor: Color(0xFFF3E8FF),
      darkColor: Color(0xFF7C3AED),
      emoji: '📈',
    ),
    CategoryData(
      id: 'business',
      name: 'Business',
      icon: Icons.business,
      color: Color(0xFFF59E0B),
      bgColor: Color(0xFFFEF3C7),
      lightBgColor: Color(0xFFFFFBEB),
      darkColor: Color(0xFFD97706),
      emoji: '🏢',
    ),
    CategoryData(
      id: 'other',
      name: 'Other Income',
      icon: Icons.attach_money,
      color: Color(0xFF84CC16),
      bgColor: Color(0xFFDCFCE7),
      lightBgColor: Color(0xFFF0FDF4),
      darkColor: Color(0xFF65A30D),
      emoji: '💰',
    ),
  ];

  static CategoryData? getCategoryById(String id, {bool isExpense = true}) {
    final categories = isExpense ? expenseCategories : incomeCategories;
    try {
      return categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }
}
