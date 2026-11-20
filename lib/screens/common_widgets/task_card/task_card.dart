import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/task_notifier_provider.dart';
import 'package:task_management_app/screens/common_widgets/task_card/widgets/date_time_text.dart';
import 'package:task_management_app/screens/common_widgets/task_card/widgets/status_badge.dart';
import 'package:task_management_app/screens/common_widgets/task_card/widgets/status_button.dart';
import 'package:task_management_app/screens/common_widgets/task_card/widgets/task_menu.dart';
import '../../../constants/colors.dart';
import '../../../models/task_model.dart';


class TaskCard extends ConsumerWidget{
  final String taskId;
  const TaskCard({
    super.key, required this.taskId
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskByIdProvider(taskId));
    if(task == null) return const SizedBox.shrink();
    final isCompleted = task.status == TaskStatus.completed;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 8,
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: StatusButton(task: task),
            title: Text(
              task.title,
              style: TextStyle(
                color: isCompleted ? Colors.white60 : Colors.white,
                fontSize: 15,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationThickness: 3,
                decorationColor: Colors.white70,
              ),
            ),
            trailing: TaskMenu(task: task),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  task.description,
                  style: TextStyle(
                    color: isCompleted ? Colors.white54 : Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        task.category.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: DateTimeChip(task: task),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if(task.isExpired)
        const ExpiredBadge(),
      ],
    );
  }
}




