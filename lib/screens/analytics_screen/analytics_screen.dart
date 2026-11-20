import 'package:flutter/material.dart';
import 'package:task_management_app/screens/analytics_screen/widgets/color_guide_circles.dart';
import 'package:task_management_app/screens/analytics_screen/widgets/overall_performance_ring.dart';
import 'package:task_management_app/screens/analytics_screen/widgets/reset_all_button.dart';
import 'package:task_management_app/screens/analytics_screen/widgets/weekly_performance_chart.dart';
import 'package:task_management_app/screens/common_widgets/section_heading.dart';
import '../../constants/colors.dart';

class AnalyticsScreen extends StatelessWidget{
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Analytics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(text: 'Daywise Performance'),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.lerp(AppColors.cardColor, Colors.white, 0.05)!,
                    AppColors.primaryColor,
                  ],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Completion rate for the last 7 days',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  SizedBox(height: 18),
                  DayWisePerformanceChart(),
                  SizedBox(height: 14),
                  ColorGuide(),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const SectionHeading(text: 'Overall Performance'),
            const SizedBox(height: 12),
            const OverallPerformanceRing(),
            const SizedBox(height: 20),
            const ColorGuide(),
            const SizedBox(height: 36),
            const ResetAllButton(),
          ],
        ),
      ),
    );
  }
}
