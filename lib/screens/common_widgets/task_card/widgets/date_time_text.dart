import 'package:flutter/material.dart';
import '../../../../models/task_model.dart';

class DateTimeChip extends StatelessWidget {
  const DateTimeChip({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            '${task.date.day}/${task.date.month}/${task.date.year}',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(width: 8),
          Text(
            task.time.format(context),
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
