import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';
import '../../../../models/task_model.dart';
import '../../../../providers/task_notifier_provider.dart';

class StatusButton extends ConsumerWidget {
  final TaskModel task;

  const StatusButton({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final newStatus = task.status == TaskStatus.completed
            ? TaskStatus.pending
            : TaskStatus.completed;
        ref.read(taskNotifierProvider.notifier).updateStatus(task.id, newStatus);
      },
      icon: task.status == TaskStatus.completed
          ? const Icon(Icons.check_circle, color: AppColors.completedColor, size: 28)
          : const Icon(
              Icons.circle_outlined,
              size: 28,
              color: AppColors.pendingColor,
            ),
    );
  }
}
