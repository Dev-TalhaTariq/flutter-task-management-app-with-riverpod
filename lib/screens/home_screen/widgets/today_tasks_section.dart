import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/common_widgets/empty_tasks_view.dart';
import '../../../providers/filtered_tasks_provider.dart';
import '../../common_widgets/section_heading.dart';
import '../../common_widgets/task_card/task_card.dart';

class TodayTasksSection extends ConsumerWidget {
  const TodayTasksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayTasks = ref.watch(todayTaskIdsProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(text: 'Today\'s Tasks'),
          const SizedBox(height: 10),
          if (todayTasks.isEmpty)
            const Padding(
              padding: EdgeInsets.all(2),
              child: NoTasksFound(),
            )
          else
            for (final taskId in todayTasks)
              TaskCard(taskId: taskId, key: ValueKey(taskId)),
        ],
      ),
    );
  }
}
