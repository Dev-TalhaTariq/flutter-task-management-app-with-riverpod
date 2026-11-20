import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/task_notifier_provider.dart';
import '../models/analytics_model/day_wise_performance.dart';
import '../models/analytics_model/overall_performance.dart';
import '../models/task_model.dart';

final weeklyPerformanceProvider = Provider<List<DayWisePerformance>>((ref) {
  final tasks = ref.watch(taskNotifierProvider);
  final now = DateTime.now();

  return List.generate(7, (i) {
    final lastSevenDays = DateTime(now.year, now.month, now.day - (6 - i));
    final lastSevenDayTasks = tasks.where((t) => DateUtils.isSameDay(t.date, lastSevenDays));
    return DayWisePerformance(
      date: lastSevenDays,
      completed: lastSevenDayTasks.where((t) => t.status == TaskStatus.completed).length,
      pending: lastSevenDayTasks.where((t) => t.status == TaskStatus.pending && !t.isExpired).length,
      expired: lastSevenDayTasks.where((t) => t.isExpired).length,
    );
  });
});


final overallPerformanceProvider = Provider<OverallPerformance>((ref) {
  final tasks = ref.watch(taskNotifierProvider);

  return OverallPerformance(
    completed: tasks.where((t) => t.status == TaskStatus.completed).length,
    pending: tasks.where((t) => t.status == TaskStatus.pending && !t.isExpired).length,
    expired: tasks.where((t) => t.isExpired).length,
  );
});