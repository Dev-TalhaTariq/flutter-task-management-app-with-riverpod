import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/colors.dart';
import '../../../providers/analytics_provider.dart';


class DayWisePerformanceChart extends ConsumerWidget {
  const DayWisePerformanceChart({
    super.key,});

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekData = ref.watch(weeklyPerformanceProvider);
    return SizedBox(
      height: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < weekData.length; i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      weekData[i].total == 0 ? '__' : '${weekData[i]
                          .percentage}%',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 10),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6)),
                      child: SizedBox(
                        height: 110,
                        child: weekData[i].total == 0
                            ? Container(color: Colors.white12)
                            : Column(
                          children: [
                            Expanded(flex: weekData[i].expired,
                                child: Container(
                                    color: AppColors.expiredColor)),
                            Expanded(flex: weekData[i].pending,
                                child: Container(
                                    color: AppColors.pendingColor)),
                            Expanded(flex: weekData[i].completed,
                                child: Container(
                                    color: AppColors.secondaryColor)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _days[weekData[i].date.weekday - 1],
                      style: TextStyle(
                        color: DateUtils.isSameDay(
                            weekData[i].date, DateTime.now())
                            ? Colors.white
                            : Colors.white54,
                        fontSize: 12,
                        fontWeight: DateUtils.isSameDay(
                            weekData[i].date, DateTime.now())
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}