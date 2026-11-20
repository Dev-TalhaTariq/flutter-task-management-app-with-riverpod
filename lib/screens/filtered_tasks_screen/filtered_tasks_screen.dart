import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/common_widgets/empty_tasks_view.dart';
import '../../constants/colors.dart';
import '../../models/task_model.dart';
import '../../providers/filtered_tasks_provider.dart';
import '../common_widgets/task_card/task_card.dart';

class FilteredTasksScreen extends ConsumerWidget {
  final String? title;
  final TaskStatusFilter? statusFilter;
  final TaskCategory? category;

  const FilteredTasksScreen.statusFilter({
    super.key,
    required this.title,
    required TaskStatusFilter this.statusFilter,
  }) : category = null;

  const FilteredTasksScreen.category({
    super.key,
    required TaskCategory this.category,
  }) : statusFilter = null, title = null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = statusFilter != null
        ? ref.watch(taskStatusFilterProvider(statusFilter!))
        : ref.watch(taskCategoryFilterProvider(category!));
    final appBarTitle = title ?? category!.label;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: Navigator.of(context).pop,
          color: Colors.white,
        ),
        backgroundColor: AppColors.barColor,
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: tasks.isEmpty
          ? const NoTasksFound()
          : ListView.builder(
              itemCount: tasks.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final taskId = tasks[index].id;
                return TaskCard(taskId: taskId, key: Key(taskId));
              },
            ),
    );
  }
}
