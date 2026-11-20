import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/filtered_tasks_provider.dart';

class GreetingsSection extends ConsumerWidget {
  const GreetingsSection({super.key});

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 5) return 'Good Night!';
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    if (hour < 21) return 'Good Evening!';
    return 'Good Night!';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayTasksCount = ref.watch(todayTaskIdsProvider.select((ids) => ids.length));

    final subtitle = switch (todayTasksCount) {
      0 => 'No tasks for today. Enjoy your day!',
      1 => 'You have only 1 task today',
      _ => 'You have $todayTasksCount tasks today',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _greeting,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white60, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
