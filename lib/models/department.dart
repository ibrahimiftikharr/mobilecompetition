import 'package:flutter/material.dart';

class Department {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final int courseCount;

  Department({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.courseCount,
  });
}
