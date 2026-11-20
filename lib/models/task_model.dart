import 'package:flutter/material.dart';

enum TaskCategory {
  general(label: 'General', icon: Icons.category_outlined),
  personal(label: 'Personal', icon: Icons.person_outlined),
  work(label: 'Work', icon: Icons.work_outlined);

  final String label;
  final IconData icon;

  const TaskCategory({required this.label, required this.icon});
}

enum TaskStatus { completed, pending }

class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final TaskCategory category;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.category = TaskCategory.general,
    this.status = TaskStatus.pending,
  });

  bool get isExpired{
    if (status != TaskStatus.pending) return false;
    final today = DateTime.now();
    final dateOnly = DateTime(date.year, date.month, date.day);
    final todayOnly = DateTime(today.year, today.month, today.day);
    return todayOnly.isAfter(dateOnly);
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    TaskCategory? category,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      category: category ?? this.category,
      status: status ?? this.status
    );
  }
}

