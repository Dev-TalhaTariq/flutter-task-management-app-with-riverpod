import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../common_widgets/section_heading.dart';


class CategoryCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final int totalTasks;
  final int completedTasks;
  const CategoryCard({
    super.key, required this.title, required this.totalTasks, required this.completedTasks, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$totalTasks', style: const TextStyle(color: Colors.white54, fontSize: 12),),
                SectionHeading(text: title,),
              ],
            ),
            const SizedBox(height: 2,),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                minHeight: 5,
                value: progress,
                valueColor: const AlwaysStoppedAnimation(AppColors.secondaryColor),
                backgroundColor: Colors.white12,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$completedTasks/$totalTasks', style: const TextStyle(color: Colors.white54, fontSize: 11),),
                Text('${(progress * 100).round()}%', style: const TextStyle(color: Colors.white54, fontSize: 11),),
              ],
            )
          ],
        ),
      ),
    );
  }
}