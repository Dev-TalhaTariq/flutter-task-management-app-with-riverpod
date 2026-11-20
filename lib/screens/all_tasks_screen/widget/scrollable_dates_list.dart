import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class ScrollableDatesList extends StatelessWidget {
  final int totalDays;
  final int daysBefore;
  final ValueChanged<DateTime> onSelected;
  final DateTime selectedDate;
  final bool isDimmed;

  const ScrollableDatesList({
    super.key,
    this.totalDays = 15,

    this.daysBefore = 3,
    required this.onSelected,
    required this.selectedDate, this.isDimmed = false,
  });

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dates = List.generate(
      totalDays,
      (i) => DateTime(now.year, now.month, now.day - daysBefore + i),
    );
    return Opacity(
      opacity: isDimmed ? 0.3 : 1.0,
      child: IgnorePointer(
        ignoring: isDimmed,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: totalDays,
          itemBuilder: (context, index) {
            final date = dates[index];
            final isSelected = DateUtils.isSameDay(date, selectedDate);
            final isToday = DateUtils.isSameDay(date, now);
            return GestureDetector(
              onTap: () => onSelected(date),
              child: Container(
                width: 55,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: isToday && !isSelected ? Border.all(color: AppColors.secondaryColor.withValues(alpha: 0.5), width: 1.2) : null
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(
                      _days[date.weekday - 1],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
