import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/providers/date_provider.dart';
import 'package:task_management_app/providers/search_query_provider.dart';
import 'package:task_management_app/providers/task_notifier_provider.dart';

int _byDateTime(TaskModel a, TaskModel b) {
  final x = DateTime(
    a.date.year,
    a.date.month,
    a.date.day,
    a.time.hour,
    a.time.minute,
  );
  final y = DateTime(
    b.date.year,
    b.date.month,
    b.date.day,
    b.time.hour,
    b.time.minute,
  );
  return x.compareTo(y);
}

final visibleTaskIdsProvider = Provider<List<String>>((ref) {
  final tasks = ref.watch(taskNotifierProvider);
  final query = ref.watch(
    searchQueryProvider.select((q) => q.trim().toLowerCase()),
  );
  if (query.isNotEmpty) {
    return (tasks
            .where(
              (t) =>
                  t.title.toLowerCase().contains(query) ||
                  t.description.toLowerCase().contains(query),
            )
            .toList()
          ..sort(_byDateTime))
        .map((t) => t.id)
        .toList();
  }

  final selectedDate = ref.watch(selectedDateProvider);
  return (tasks.where((t) => DateUtils.isSameDay(t.date, selectedDate)).toList()
        ..sort(_byDateTime))
      .map((t) => t.id)
      .toList();
});

final todayTaskIdsProvider = Provider<List<String>>((ref) {
  final tasks = ref.watch(taskNotifierProvider);
  final now = DateTime.now();
  return tasks.where((t) => DateUtils.isSameDay(t.date, now)).map((t) => t.id).toList();
});

enum TaskStatusFilter { pending, completed, expired }

final taskStatusFilterProvider =
    Provider.family<List<TaskModel>, TaskStatusFilter>((ref, filter) {
      final tasks = ref.watch(taskNotifierProvider);
      return switch (filter) {
        TaskStatusFilter.pending =>
          tasks
              .where((t) => t.status == TaskStatus.pending && !t.isExpired)
              .toList(),
        TaskStatusFilter.completed =>
          tasks.where((t) => t.status == TaskStatus.completed).toList(),
        TaskStatusFilter.expired => tasks.where((t) => t.isExpired).toList(),
      };
    });

final taskCategoryFilterProvider =
    Provider.family<List<TaskModel>, TaskCategory>((ref, category) {
      final tasks = ref.watch(taskNotifierProvider);
      return tasks.where((t) => t.category == category).toList();
    });
