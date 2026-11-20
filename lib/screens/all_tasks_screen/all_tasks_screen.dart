import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/date_provider.dart';
import 'package:task_management_app/providers/filtered_tasks_provider.dart';
import 'package:task_management_app/screens/all_tasks_screen/widget/scrollable_dates_list.dart';
import 'package:task_management_app/screens/all_tasks_screen/widget/task_search_bar.dart';
import 'package:task_management_app/screens/common_widgets/floating_action_button.dart';
import '../../constants/colors.dart';
import '../../providers/search_query_provider.dart';
import '../common_widgets/empty_tasks_view.dart';
import '../common_widgets/task_card/task_card.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FAB(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'All Tasks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TaskSearchBar()),
          const SizedBox(height: 28),
          SizedBox(
            height: 75,
            child: Consumer(
              builder: (context, ref, child) {
                final selectedDate = ref.watch(selectedDateProvider);
                final isSearching = ref.watch(
                  searchQueryProvider.select((q) => q.trim().isNotEmpty),
                );
                return ScrollableDatesList(
                  selectedDate: selectedDate,
                  isDimmed: isSearching,
                  onSelected: (date) {
                    ref.read(selectedDateProvider.notifier).select(date);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final idsKey = ref.watch(
                  visibleTaskIdsProvider.select((t) => t.join(',')),
                );
                if (idsKey.isEmpty) {
                  return const NoTasksFound();
                }
                final ids = idsKey.split(',');
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.vertical,
                  itemCount: ids.length,
                  itemBuilder: (context, index) {
                    final taskId = ids[index];
                    return TaskCard(taskId: taskId, key: ValueKey(taskId));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
