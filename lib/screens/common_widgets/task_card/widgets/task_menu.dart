import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';
import '../../../../models/task_model.dart';
import '../../../../providers/task_notifier_provider.dart';
import '../../../add_task_screen/add_task_screen.dart';

class TaskMenu extends ConsumerWidget {
  final TaskModel task;

  const TaskMenu({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      color: AppColors.barColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        if (value == 'edit') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen(taskToEdit: task)),
          );
        } else if (value == 'delete') {
          ref.read(taskNotifierProvider.notifier).deleteTask(task.id);
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'edit',
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.edit, color: Colors.blue),
            title: Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text(
              'Delete',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
