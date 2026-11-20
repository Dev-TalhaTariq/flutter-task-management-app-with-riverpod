import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/providers/navigation_provider.dart';
import 'package:task_management_app/screens/all_tasks_screen/all_tasks_screen.dart';
import 'package:task_management_app/screens/analytics_screen/analytics_screen.dart';
import 'package:task_management_app/screens/home_screen/home_screen.dart';
import '../constants/colors.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  static const _pages = [HomeScreen(), AllTasksScreen(), AnalyticsScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _pages),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: ref.read(navigationProvider.notifier).changeScreen,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.barColor,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: Colors.white30,
          selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          ],
        ),
      ),
    );
  }
}

