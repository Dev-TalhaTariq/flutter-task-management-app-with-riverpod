import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/home_screen/widgets/status_card.dart';

import '../../../constants/colors.dart';
import '../../../providers/filtered_tasks_provider.dart';
import '../../common_widgets/section_heading.dart';
import '../../filtered_tasks_screen/filtered_tasks_screen.dart';

class StatusSection extends ConsumerWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   int statusCount(TaskStatusFilter f) {
      return ref.watch(taskStatusFilterProvider(f).select((l) => l.length));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(text: 'Status'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: StatusCard(
                  onTap: () => _openStatus(
                    context,
                    TaskStatusFilter.completed,
                    'Completed',
                  ),
                  title: 'Completed',
                  icon: Icons.check_circle,
                  iconColor: AppColors.completedColor,
                  quantity: statusCount(TaskStatusFilter.completed),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: StatusCard(
                  onTap: () => _openStatus(
                    context,
                    TaskStatusFilter.pending,
                    'Pending',
                  ),
                  title: 'Pending',
                  icon: Icons.access_time,
                  quantity: statusCount(TaskStatusFilter.pending),
                  iconColor: AppColors.pendingColor,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: StatusCard(
                  onTap: () => _openStatus(
                    context,
                    TaskStatusFilter.expired,
                    'Expired',
                  ),
                  title: 'Expired',
                  icon: Icons.warning_amber_rounded,
                  iconColor: AppColors.expiredColor,
                  quantity: statusCount(TaskStatusFilter.expired),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _openStatus(
      BuildContext context,
      TaskStatusFilter statusFilter,
      String title,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FilteredTasksScreen.statusFilter(
          title: title,
          statusFilter: statusFilter,
        ),
      ),
    );
  }
}
