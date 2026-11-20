import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/colors.dart';
import '../../../providers/analytics_provider.dart';
class OverallPerformanceRing extends ConsumerWidget{
  const OverallPerformanceRing({
    super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final overallData = ref.watch(overallPerformanceProvider);

    return Center(
      child: SizedBox(
        width: 180,
        height: 180,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            if (overallData.total == 0)
              const CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 14,
                color: Colors.white12,
              )
            else ...[
              const CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 14,
                color: AppColors.expiredColor,
              ),
              CircularProgressIndicator(
                value: (overallData.completed + overallData.pending) / overallData.total,
                strokeWidth: 14,
                color: AppColors.pendingColor,
              ),
              CircularProgressIndicator(
                value: overallData.completed / overallData.total,
                strokeWidth: 14,
                color: AppColors.secondaryColor,
              ),
            ],
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${overallData.percentage}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${overallData.completed} / ${overallData.total} done',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}