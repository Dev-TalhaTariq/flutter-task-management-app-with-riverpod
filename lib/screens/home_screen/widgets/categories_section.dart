import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/home_screen/widgets/category_card.dart';
import 'package:task_management_app/screens/filtered_tasks_screen/filtered_tasks_screen.dart';
import '../../../models/task_model.dart';
import '../../../providers/filtered_tasks_provider.dart';
import '../../common_widgets/section_heading.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SectionHeading(text: 'Categories'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 125,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemCount: TaskCategory.values.length,
            itemBuilder: (context, index) {
              final category = TaskCategory.values[index];
              return Consumer(
                builder: (context, ref, child) {
                  final tasks = ref.watch(taskCategoryFilterProvider(category));
                  final completedLength = tasks
                      .where((t) => t.status == TaskStatus.completed)
                      .length;
                  return CategoryCard(
                    title: category.label,
                    totalTasks: tasks.length,
                    completedTasks: completedLength,
                    onTap: () => _openCategory(context, category),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _openCategory(BuildContext context, TaskCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FilteredTasksScreen.category(category: category),
      ),
    );
  }
}
