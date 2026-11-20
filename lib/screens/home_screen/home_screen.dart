import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/add_task_screen/add_task_screen.dart';
import 'package:task_management_app/screens/home_screen/widgets/greetings_section.dart';
import 'package:task_management_app/screens/home_screen/widgets/status_section.dart';
import 'package:task_management_app/screens/home_screen/widgets/today_tasks_section.dart';
import '../../constants/colors.dart';
import '../common_widgets/floating_action_button.dart';
import 'widgets/categories_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: FAB(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingsSection(),
                SizedBox(height: 24),
                CategoriesSection(),
                SizedBox(height: 28),
                StatusSection(),
                SizedBox(height: 28),
               TodayTasksSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
